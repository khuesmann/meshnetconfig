<!DOCTYPE html>
<html>
<head>
    <title>MeshNetConf</title>
    <meta name="author" content="Karim Huesmann">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="csrf-token" id="token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="shortcut icon" href="/img/favicon.ico" />
    @yield('additional-css')

</head>
<body>

@include('layout.navigation')

<div class="m-t-50" id="app">
    @yield('content')
</div>


<script>
    window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
            'noVue' => $noVue ?? false
    ]); ?> ;
</script>
<script src="/js/app.js"></script>
@yield('additional-js')

</body>
</html>

