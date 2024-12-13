'use strict'

class Debug
    @Log: (cmdin) ->
        console.log "Log: " + cmdin
    @LogError: (cmdin) ->
        console.error "Error: " + cmdin
    @LogWarning: (cmdin) ->
        console.warn "Warning: " + cmdin

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
    @SetPos: (coolguydo_vec3) ->
        @newBase.pos_x = coolguydo_vec3.x
        @newBase.pos_y = coolguydo_vec3.y
        @newBase.pos_z = coolguydo_vec3.z
    @SetRot: (coolguydo_vec3) ->
        @newBase.rot_x = coolguydo_vec3.x
        @newBase.rot_y = coolguydo_vec3.y
        @newBase.rot_z = coolguydo_vec3.z
    @Scale: (coolguydo_vec3) ->
        @newBase.scl_x = coolguydo_vec3.x
        @newBase.scl_y = coolguydo_vec3.y
        @newBase.scl_z = coolguydo_vec3.z
    @TranslateX: (input_man) ->
        @newBase.pos_x += input_man
    @TranslateY: (input_man) ->
        @newBase.pos_y += input_man
    @TranslateZ: (input_man) ->
        @newBase.pos_z += input_man
    @WaitMilliSeconds: (wait_func, time_ms) ->
        setTimeout wait_func, time_ms