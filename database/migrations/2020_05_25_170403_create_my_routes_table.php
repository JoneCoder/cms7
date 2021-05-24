<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMyRoutesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('my_routes', function (Blueprint $table) {
            $table->id();
            $table->string('namespace', 50)->nullable();
            $table->string('name', 20)->nullable();
            $table->string('path', 20)->nullable();
            $table->string('type', 20)->default('backend');
            $table->string('controller', 50)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('my_routes');
    }
}
