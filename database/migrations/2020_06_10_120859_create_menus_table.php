<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->integer('parent_id')->nullable();
            $table->integer('content_id')->nullable();
            $table->string('menu_look_type', 10)->nullable();
            $table->string('type', 15)->nullable();
            $table->string('url', 100)->nullable();
            $table->string('position', 15)->nullable();
            $table->string('title')->nullable();
            $table->string('slug')->nullable();
            $table->string('params')->nullable();
            $table->enum('status', ['a', 'd'])->default('a');
            $table->tinyInteger('sorting')->default(0);
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
        Schema::dropIfExists('menus');
    }
}
