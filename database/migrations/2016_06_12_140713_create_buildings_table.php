<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBuildingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('buildings', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();

            $table->string('name')->unique();

            $table->double('latitude')->nullable();
            $table->double('longitude')->nullable();
            $table->double('latitude2')->nullable();
            $table->double('longitude2')->nullable();
            $table->double('latitude3')->nullable();
            $table->double('longitude3')->nullable();
            
            $table->enum("scale_by", array_keys(\App\Models\Building\Building::SCALE_TYPE_ENUM))->default('unscaled');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('buildings');
    }
}
