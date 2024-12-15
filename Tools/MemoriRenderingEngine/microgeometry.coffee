meshoptimizer = require 'meshoptimizer'

str_to_array = (binStr) ->
    return parseInt binStr.split('')

array_to_str = (array_int) ->
    a = array_int.join().split(',')
    b = ''
    for pages in a
        b = b + pages
    return b

simplifyVerticesBeyondThreshold = (vertices, threshold, newIndexBuffer) ->
    newVertices = []
    i = 0
    while i < vertices.length
        x = vertices[i]
        y = vertices[i + 1]
        z = vertices[i + 2]
        distance = Math.sqrt(x * x + y * y + z * z)
        if distance <= threshold
            newVertices.push x, y, z
        else
            newVertices.push meshoptimizer.simplify [x, y, z], newIndexBuffer, 0.5
        i += 3
    return newVertices

simplifyMeshViaCamera = (binstr, threshold) ->
    vertices = str_to_array vertices_on_camera_binstr
    remap = new Uint32Array(vertices.length / 3)
    vertexCount = meshoptimizer.generateVertexRemap(remap, null, vertices.length / 3, vertices, vertices.length, 3)
    newIndexBuffer = new Uint32Array(vertices.length / 3)
    meshoptimizer.remapIndices newIndexBuffer, remap, remap.length, vertices, vertices.length / 3
    return array_to_str simplifyVerticesBeyondThreshold vertices, threshold, newIndexBuffer

simplifyMeshViaCamera '011000264', 2