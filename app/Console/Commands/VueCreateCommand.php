<?php

namespace App\Console\Commands;

use Illuminate\Console\GeneratorCommand;

class VueCreateCommand extends GeneratorCommand
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'make:vue-create';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a new Vue template';

    /**
     * The type of class being generated.
     *
     * @var string
     */
    protected $type = 'Vue create';

    /**
     * Get the stub file for the generator.
     *
     * @return string
     */
    protected function getStub()
    {
        return __DIR__ . '/../stubs/vue-create.stub';
    }

    /**
     * Determine if the class already exists.
     *
     * @param  string  $rawName
     * @return bool
     */
    protected function alreadyExists($rawName)
    {
        $name       = class_basename(str_replace('\\', '/', $rawName));
        $folderPath = "{$this->laravel['path']}/../resources/js/views/backend/";
        $ex         = explode(".", $name);

        if (!empty(count($ex) > 1)) {
            $path = $folderPath . "$ex[0]/$ex[1].vue";
        } else {
            $path = $folderPath . "$name.vue";
        }
        return file_exists($path);
    }

    /**
     * Replace the namespace for the given stub.
     *
     * @param  string  $stub
     * @param  string  $name
     * @return $this
     */
    protected function replaceNamespace(&$stub, $name)
    {
        $name = class_basename(str_replace('\\', '/', $name));

        $ex =  explode(".", $name);
        $stub = str_replace('{Component}', lcfirst($ex[0]), $stub);

        return $this;
    }

    /**
     * Get the destination class path.
     *
     * @param  string  $name
     * @return string
     */
    protected function getPath($name)
    {
        $name       = class_basename(str_replace('\\', '/', $name));
        $folderPath = "{$this->laravel['path']}/../resources/js/views/backend/";
        $ex         = explode(".", $name);
        $folder     = $ex[0];

        if (!empty(count($ex) > 1)) {
            $file = $ex[1];
            $path = $folderPath . $folder;
            if (!file_exists($path)) {
                mkdir($path);
            }
            return $folderPath . "$folder/$file.vue";
        } else {
            return $folderPath . "$name.vue";
        }
    }
}
