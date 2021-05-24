<!DOCTYPE html>
<html>

<head data-baseurl="{{URL::to('/')}}">
    <meta charset="utf-8">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="{{ asset('images/favicon.png') }}">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="base-url" content="{{URL::to('/')}}" />
    <script>
        window.laravel = {
            csrfToken: '{{ csrf_token() }}',
            baseurl: '{{URL::to("/")}}'
        }
    </script>
    <title>{{ config('app.name') }}</title>
    <!-- Font Awesome Ionicons -->
    <link rel="stylesheet" href="{{ asset('assets') }}/icons/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="{{ asset('assets') }}/icons/Ionicons/css/ionicons.min.css">
    <!-- Styles -->
    <link href="{{ asset('assets/css/layouts.css') }}" rel="stylesheet">
</head>

<body class="hold-transition skin-blue sidebar-mini body">
    <div id="app">
        <app />
    </div>

    <!-- App js -->
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('assets/js/layouts.js') }}"></script>
</body>

</html>