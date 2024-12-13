'use strict'

class Debug
    @Log: (usrin) ->
        console.log usrin

class Vector3
    constructor: (x_in, y_in, z_in) ->
        @x = x_in
        @y = y_in
        @z = z_in
    @TranslateX: (input_man) ->
        @x += input_man
    @TranslateY: (input_man) ->
        @y += input_man
    @TranslateZ: (input_man) ->
        @z += input_man

class GameObject_Base
    constructor: (@name, @pos, @rot, @scl, @setupFunc, @updateFunc, @terminateFunc) ->
        @pos_x = @pos.x
        @pos_y = @pos.y
        @pos_z = @pos.z
        @rot_x = @rot.x
        @rot_y = @rot.y
        @rot_z = @rot.z
        @scl_x = @scl.x
        @scl_y = @scl.y
        @scl_z = @scl.z
        @running_current = true
    @StartFunc: () ->
        @setupFunc()
        while @running_current
            @updateFunc()
        @terminateFunc()

class GameObject
    @setup_gen = null
    @update_gen = null
    @terminate_gen = null
    @newBase = null
    constructor: (@name) ->
        @setup_gen = -> return
        @update_gen = -> return
        @terminate_gen = -> return
        @newBase = new GameObject_Base @name, Vector3(0, 0, 0), Vector3(0, 0, 0), Vector3(1, 1, 1), setup_gen, update_gen, terminate_gen
    @StartFunc: () ->
        @newBase.StartFunc
    @Setup: (setup_in) ->
        @setup_gen = setup_in
    @OnUpdate: (update_in) ->
        @update_gen = update_in
    @OnTerminate: (terminate_in) ->
        @terminate_gen = terminate_in
    @ForceTerminate: () ->
        @newBase.running_current = false


player = new GameObject "Player"