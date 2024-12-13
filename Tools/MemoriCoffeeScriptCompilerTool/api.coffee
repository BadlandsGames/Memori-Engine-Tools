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
    async @StartFunc: () ->
        try
            @newBase.StartFunc
        catch error
            Debug.Log("Error on function: StartFunc")
    async @Setup: (setup_in) ->
        try
            @setup_gen = setup_in
        catch error
            Debug.Log("Error on function: Setup")
    async @OnUpdate: (update_in) ->
        try
            @update_gen = update_in
        catch error
            Debug.Log("Error on function: OnUpdate")
    async @OnTerminate: (terminate_in) ->
        try
            @terminate_gen = terminate_in
        catch error
            Debug.Log("Error on function: OnTerminate")
    async @ForceTerminate: () ->
        try
            @newBase.running_current = false
        catch error
            Debug.Log("Error on function: ForceTerminate")
    async @SetPos: (coolguydo_vec3) ->
        try
            @newBase.pos_x = coolguydo_vec3.x
            @newBase.pos_y = coolguydo_vec3.y
            @newBase.pos_z = coolguydo_vec3.z
        catch error
            Debug.Log("Error on function: SetPos")
    async @SetRot: (coolguydo_vec3) ->
        try
            @newBase.rot_x = coolguydo_vec3.x
            @newBase.rot_y = coolguydo_vec3.y
            @newBase.rot_z = coolguydo_vec3.z
        catch error
            Debug.Log("Error on function: SetRot")
    async @Scale: (coolguydo_vec3) ->
        try
            @newBase.scl_x = coolguydo_vec3.x
            @newBase.scl_y = coolguydo_vec3.y
            @newBase.scl_z = coolguydo_vec3.z
        catch error
            Debug.Log("Error on function: Scale")
    async @TranslateX: (input_man) ->
        try
            @newBase.pos_x += input_man
        catch error
            Debug.Log("Error on function: TranslateX")
    async @TranslateY: (input_man) ->
        try
            @newBase.pos_y += input_man
        catch error
            Debug.Log("Error on function: TranslateY")
    async @TranslateZ: (input_man) ->
        try
            @newBase.pos_z += input_man
        catch error
            Debug.Log("Error(function: TranslateZ, object: " + @name + ")")
    async @Wait: (wait_func) ->
        try
        catch error