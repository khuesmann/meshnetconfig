<template>
    <div class="room-manager" :class="{'fixed': show}">
        <div :class="{'container': show, 'fixed-container': show}">
            <h3>Room-Manager
                <a class="btn btn-success btn-xs" v-if="!show" @click="show=!show">Show</a>
                <a class="btn btn-danger btn-xs" v-if="show" @click="show=!show">Hide</a>
            </h3>
            <p v-show="!show">Use room manager to create floor's rooms with a GUI interface</p>
            <div v-show="show && !loading">
                <div class="row">
                    <div class="col-sm-6">
                        <h3>Foundation</h3>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>
                                        x
                                        <input v-model="x" placeholder="x">
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>
                                        z
                                        <input v-model="z" placeholder="z">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div id="lattice" class="lattice">
                            <div :data-point="latticePoint.x + '|' + latticePoint.z" v-bind:style="{opacity: latticePoint.alpha}"
                                 v-on:mousedown="clicked = true;" v-on:mouseover="groupSelection(latticePoint, $event)"
                                 v-on:mouseup="clicked = false" class="latticePoint" v-on:click="toggle(latticePoint, $event)"
                                 v-bind:class="{'selected': latticePoint.selected, 'last': latticePoint.x != 0 && latticePoint.x % (x - 1) == 0, 'added': latticePoint.hasRoom }"
                                 v-for="latticePoint in latticePoints">{{latticePoint.displayedText}}
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    </div>
                    <div class="col-sm-12">
                        <button class="btn btn-default pull-left" v-on:click="addRoom()">Add room</button>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-sm-12" v-show="currentFloor.rooms.length > 0">
                        <h3>New rooms for floor <i>{{floor.name}}</i></h3>

                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table">
                                    <tr>
                                        <th>Number</th>
                                        <th>Name</th>
                                        <th>Grid Start (x,z)</th>
                                        <th>Grid Stop (x,z)</th>
                                        <th>Color (r,g,b,a)</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    <tr v-for="room in currentFloor.rooms">
                                        <td>{{room.number}}</td>
                                        <td>
                                            <input class="" v-model="room.id">
                                        </td>
                                        <td>
                                            {{room.grid.start.x}}, {{room.grid.start.z}}

                                        </td>
                                        <td>
                                            {{room.grid.stop.x}}, {{room.grid.stop.z}}

                                        </td>
                                        <td>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <input class="" v-model="room.color.r">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="" v-model="room.color.g">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="" v-model="room.color.b">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="" v-model="room.color.alpha">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a class="btn btn-danger btn-xs" v-on:click="removeRoom(room)" href="#!">remove</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-12">
                                <a class="btn btn-xl btn-success" @click="create()">Create</a>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div v-show="loading">loading</div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['floor', 'createroute'],
        data() {
            return {
                x: 15,
                z: 15,
                show: false,
                loading: false,
                roomCount: 0,
                clicked: false,
                currentFloor: {
                    floorNumber: 0,
                    height: 2.5,
                    rooms: []
                },
                floors: [],
                latticePoints: [
                    {
                        x: null,
                        z: null,
                        selected: false,
                        displayedText: null,
                        hasRoom: false
                    }
                ]

            }
        },
        mounted() {
            this.initLattice();
        },
        watch: {
            x () {
                this.initLattice();
            },
            z () {
                this.initLattice();
            },
            show() {
                setTimeout(() => {
                    this.initLattice();
                }, 0)
            }
        },

        methods: {
            initLattice() {
                var latticePoints = [];
                for (var z = this.z - 1; z >= 0; z--) {
                    for (var x = 0; x < this.x; x++) {
                        latticePoints.push({
                            x: x,
                            z: z,
                            selected: false,
                            displayedText: x + "," + z,
                            hasRoom: false
                        })
                    }
                }
                this.latticePoints= latticePoints;
                this.resizeWrapper();
            },
            resizeWrapper () {
                var latticeWrapper = $('.lattice');
                var latticePoint = latticeWrapper.find('.latticePoint').first();
                var latticePointWidth = latticePoint.width() + 2; // 2px for boarder
                console.log(latticePointWidth * this.x);
                latticeWrapper.width(latticePointWidth * this.x)
            },
            groupSelection (latticePoint, event) {
                if (this.clicked) {
                    this.toggle(latticePoint, event, true);
                }
            },
            toggle (latticePoint, event, onlyOn) {
                latticePoint.selected = !latticePoint.selected;
                if (latticePoint.selected || onlyOn) {
                    $(event.target).addClass('selected');
                }
                else {
                    $(event.target).removeClass('selected');
                }
            },
            addRoom: function () {
                this.roomCount++;
                var roomCount = this.roomCount < 10 ? "0" + this.roomCount : this.roomCount;
                var room = {
                    id: this.floor.level + roomCount,
                    number: null,
                    grid: {
                        start: {
                            x: null,
                            z: null
                        },
                        stop: {
                            x: null,
                            z: null
                        }
                    },
                    color: {
                        r: 0,
                        g: 0,
                        b: 0,
                        alpha: 0.2
                    }
                };
                var tmpBeginX = this.x;
                var tmpBeginZ = this.z;
                var tmpEndX = 0;
                var tmpEndZ = 0;
                for (var i = 0; i < this.latticePoints.length; i++) {
                    if (this.latticePoints[i].selected ) {
                        if (this.latticePoints[i].x < tmpBeginX) {
                            tmpBeginX = this.latticePoints[i].x;
                        }
                        if (this.latticePoints[i].z < tmpBeginZ) {
                            tmpBeginZ = this.latticePoints[i].z;
                        }
                        if (this.latticePoints[i].x > tmpEndX) {
                            tmpEndX = this.latticePoints[i].x;
                        }
                        if (this.latticePoints[i].z > tmpEndZ) {
                            tmpEndZ = this.latticePoints[i].z;
                        }
                        this.latticePoints[i].selected = false;
                        this.latticePoints[i].hasRoom = true;
                        this.latticePoints[i].displayedText = this.roomCount;
                    }
                }
                room.grid.start.x = tmpBeginX;
                room.grid.start.z = tmpBeginZ;
                room.grid.stop.x = tmpEndX + 1;
                room.grid.stop.z = tmpEndZ + 1;
                room.number = this.roomCount;
                this.currentFloor.rooms.push(room);
            },
            removeRoom(room) {
                this.currentFloor.rooms = $.grep(this.currentFloor.rooms, function(floorRoom){
                    return floorRoom.id != room.id;
                });
                this.$delete(this.currentFloor.rooms, room);
                var roomLatticePoints = [];
                console.log(room);
                for(var x = room.grid.start.x; x < room.grid.stop.x; x++) {
                    for(var z = room.grid.start.z; z < room.grid.stop.z; z++) {
                        roomLatticePoints.push({
                            x: x,
                            z: z
                        })
                    }
                }
                for(var i = 0; i < this.latticePoints.length; i++) {
                    var latticePoint = this.latticePoints[i];
                    for(var j = 0; j < roomLatticePoints.length; j++) {
                        var roomLatticePoint = roomLatticePoints[j];
                        if(latticePoint.x == roomLatticePoint.x && latticePoint.z == roomLatticePoint.z) {
                            latticePoint.selected = false;
                            latticePoint.hasRoom = false;
                            latticePoint.displayedText = latticePoint.x + "," + latticePoint.z
                        }
                    }
                }
//                this.$set(this.latticePoints, this.latticePoints);
            },
            create() {
                this.loading = true;
                var rooms = this.currentFloor.rooms;
                for(var i = 0; i < rooms.length; i ++) {
                    console.log(i);
                    var room = rooms[i];
                    this.$http.post(this.createroute, {
                        floor_id: this.floor.id,
                        name: room.id,
                        grid_start_x: room.grid.start.x,
                        grid_start_z: room.grid.start.z,
                        grid_stop_x: room.grid.stop.x,
                        grid_stop_z: room.grid.stop.z,
                        color_r: room.color.r,
                        color_g: room.color.g,
                        color_b: room.color.b,
                        color_a: room.color.a
                    }).then((response) => {
                        if(i == rooms.length) {
                            window.location = '/floor/' + this.floor.id
                        }
                    }, () => {
                        this.loading = false;
                    })
                }
            }
        }
    }
</script>

<style type="text/scss" lang="sass">
    .room-manager {
        &.fixed {
             position: absolute;
             top: 50px;
             left: 0;
             right: 0;
             bottom: 0;
             width: 100%;
             min-height: 100%;
             background: white;
        }
    }

    .lattice {
        position: relative;
        margin: auto;
        -webkit-touch-callout: none; /* iOS Safari */
        -webkit-user-select: none;   /* Chrome/Safari/Opera */
        -khtml-user-select: none;    /* Konqueror */
        -moz-user-select: none;      /* Firefox */
        -ms-user-select: none;       /* Internet Explorer/Edge */
        user-select: none;

    .latticePoint {
        border: 1px solid black;
        border-collapse: collapse;
        width: 27px;
        height: 27px;
        float: left;
        overflow: hidden;
        font-size: 9px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        text-align: center;
        line-height: 2;
        cursor:pointer;

    &.selected {
         background-color: orange !important;
     }


    &.last {
     //margin-right: 200px;
     }

    &.added {
         background-color: rgba(0,0,255,0.5);

     }
    }

    }

    .clearfix {
        clear: both;
    }
</style>