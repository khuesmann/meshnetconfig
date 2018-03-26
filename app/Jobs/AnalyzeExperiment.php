<?php

namespace App\Jobs;

use App\Models\Experiment;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class AnalyzeExperiment implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    private $experiment;
    private $filename;

    /**
     * Create a new job instance.
     *
     * @param Experiment $experiment
     * @param $filename
     */
    public function __construct(Experiment $experiment, $filename)
    {
        $this->experiment = $experiment;
        $this->filename = $filename;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        if(!empty($this->experiment->raw_experiment)) {
            \Storage::disk('local')->put($this->filename, serialize($this->experiment->analyze()));
            $this->experiment->analysis = $this->filename;
            $this->experiment->save();
        }
    }
}
