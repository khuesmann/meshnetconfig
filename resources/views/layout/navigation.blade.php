<nav class="navbar navbar-default navbar-fixed-top m-b-50">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">MeshNetConf</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown {!! isActive(["experiment.index", "mapping.index"], "active") !!}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Experiments <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="{{route('experiment.index')}}">Show all</a></li>
                        <li><a href="{{route('mapping.index')}}">Mapping</a></li>
                        <li><a href="{{route('experiment.quickStart')}}">QuickStart</a></li>
                    </ul>
                </li>
                <li class="{!! isActive(["building.index"], "active") !!}"><a href="{{route('building.index')}}">Buildings</a></li>
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</nav>