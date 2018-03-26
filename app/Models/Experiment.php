<?php

namespace App\Models;

use App\Jobs\AnalyzeExperiment;
use Illuminate\Database\Eloquent\Model;

class Experiment extends Model
{
    protected $fillable = ['name', 'mapping_id', 'analysis', 'config', 'raw_experiment'];

    /**
     * @param $file
     */
    public function saveXml($file)
    {
        if(!is_dir(storage_path('app/tmp/'))) mkdir(storage_path('app/tmp/'));
        $this->setPHPIni();
        $filename = 'rawExperiments/' . $this->id . '.xml';
        $fileContent = '';
        if (strpos($file->getMimeType(), "xml") !== false) {
            $fileContent = \File::get($file);
        }
        elseif (strpos($file->getMimeType(), "zip") !== false) {
            $tmpPath = storage_path('app/tmp/' . $this->id . '/');
            $zip = new \ZipArchive;
            if($zip->open($file) === true) {
                if(!is_dir($tmpPath)) mkdir($tmpPath);
                $zip->extractTo($tmpPath);
                $zip->close();
                $extractedFolder = array_diff(scandir($tmpPath), ['.', '..']);
                $extractedFileName = array_shift($extractedFolder);
                $fileContent = file_get_contents($tmpPath . $extractedFileName);
                unlink($tmpPath . $extractedFileName);
                rmdir($tmpPath);
            }
        }
        \Storage::disk('local')->put($filename, $fileContent);
        $this->raw_experiment = storage_path("app/" . $filename);
        $this->save();
    }

    /**
     * @return mixed
     */
    public function getXml()
    {
        return $this->raw_experiment;
    }

    /**
     *
     */
    public function createAnalysis()
    {
        $filename = 'parsedExperiments/' . $this->id . ".json";
        dispatch(new AnalyzeExperiment($this, $filename));
        return;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function mapping()
    {
        return $this->belongsTo(Mapping::class, "mapping_id", "id");
    }

    /**
     * @return array
     */
    public function analyze()
    {
        $networkViewer = new NetworkViewer\MyNetworkViewer($this);
        return $networkViewer->getAllInformation();
    }

    /**
     * @return bool|mixed
     */
    public function getAnalysis()
    {
        if (empty($this->analysis)) {
            return false;
        }
        $parsedXml = \Storage::get($this->analysis);
        if (empty($parsedXml)) {
            return false;
        }

        return unserialize($parsedXml);
    }

    /**
     *
     */
    public function deleteFiles()
    {
        $raw = 'rawExperiments/' . $this->id . ".xml";
        $parsedJson = 'parsedExperiments/' . $this->id . ".json";
        \Storage::disk('local')->delete($raw);
        \Storage::disk('local')->delete($parsedJson);
    }

    /**
     *
     */
    public function setPHPIni()
    {
        ini_set('memory_limit', "2048M");
        ini_set('upload_max_filesize', "250M");
        ini_set('post_max_size', "250M");
        ini_set('max_execution_time', 60000);
        ini_set('max_input_time', 60000);
    }

    /**
     * @return array|string
     */
    public function getConfigSettings()
    {
        if(empty($this->config)) return "";
        $config = (array) json_decode($this->config);
        $config['nodes']->raw = null;
        return $config;
    }

    /**
     * @return string
     */
    public function viewerUrl()
    {
        return env('VIEWER_URL') . "?experimentId=" . $this->id;
    }
}
