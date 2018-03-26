<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExperimentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('experiments', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->string('name');
            $table->string('ext_id')->nullable();

            $table->longText('analysis')->nullable();
            $table->longText('config')->nullable();

            $table->text('raw_experiment')->nullable();

            $table->integer('mapping_id')->unsigned()->nullable();;
            $table->foreign('mapping_id')
                ->references('id')
                ->on('mappings')
                ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('experiments');
    }
}
