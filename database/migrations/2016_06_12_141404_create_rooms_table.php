<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rooms', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->integer('floor_id')->unsigned();
            $table->foreign('floor_id')
                ->references('id')
                ->on('floors')
                ->onDelete('cascade');

            $table->string('name');

            $table->float('grid_start_x');
            $table->float('grid_start_z');

            $table->float('grid_stop_x');
            $table->float('grid_stop_z');
            
            $table->integer('color_r')->default(0);
            $table->integer('color_g')->default(0);
            $table->integer('color_b')->default(0);
            $table->float('color_a')->default(0.2);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('rooms');
    }
}
