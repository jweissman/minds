#
#  arbor.js - version 0.91
#  a graph vizualization toolkit
#
#  Copyright (c) 2012 Samizdat Drafting Co.
#  Physics code derived from springy.js, copyright (c) 2010 Dennis Hotson
#
#  Permission is hereby granted, free of charge, to any person
#  obtaining a copy of this software and associated documentation
#  files (the "Software"), to deal in the Software without
#  restriction, including without limitation the rights to use,
#  copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following
#  conditions:
    #
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#  OTHER DEALINGS IN THE SOFTWARE.
#
(($) ->
    trace = (msg) -> #        etc.js
return  if typeof (window) is "undefined" or not window.console
len = arguments_.length
args = []
i = 0

while i < len
    args.push "arguments[" + i + "]"
i++
eval_ "console.log(" + args.join(",") + ")"

dirname = (a) ->
    b = a.replace(/^\/?(.*?)\/?$/, "$1").split("/")
b.pop()
"/" + b.join("/")

basename = (b) ->
    c = b.replace(/^\/?(.*?)\/?$/, "$1").split("/")
a = c.pop()
if a is ""
null
else
a

_ordinalize_re = /(\d)(?=(\d\d\d)+(?!\d))/g
ordinalize = (a) ->
    b = "" + a
if a < 11000
    b = ("" + a).replace(_ordinalize_re, "$1,")
else
if a < 1000000
    b = Math.floor(a / 1000) + "k"
else
    b = ("" + Math.floor(a / 1000)).replace(_ordinalize_re, "$1,") + "m"  if a < 1000000000
    b

nano = (a, b) ->
    a.replace /\{([\w\-\.]*)}/g, (f, c) ->
d = c.split(".")
e = b[d.shift()]
$.each d, ->
if e.hasOwnProperty(this)
    e = e[this]
else
    e = f

e


objcopy = (a) ->
return `undefined`  if a is `undefined`
return null  if a is null
return a  if a.parentNode
    switch typeof a
        when "string"
            return a.substring(0)
            when "number"
            return a + 0
            when "boolean"
            return a is true
            b = (if ($.isArray(a)) then [] else {})
            $.each a, (d, c) ->
            b[d] = objcopy(c)

            b

            objmerge = (d, b) ->
                d = d or {}
            b = b or {}
            c = objcopy(d)
            for a of b
            c[a] = b[a]
            c

            objcmp = (e, c, d) ->
            return e is c  if not e or not c
            return false  unless typeof e is typeof c
            unless typeof e is "object"
            e is c
        else
            if $.isArray(e)
                return false  unless $.isArray(c)
            return false  unless e.length is c.length
        else
            h = []
            for f of e
            h.push f  if e.hasOwnProperty(f)
            g = []
            for f of c
            g.push f  if c.hasOwnProperty(f)
            unless d
            h.sort()
            g.sort()
            return false  if h.join(",") isnt g.join(",")
            i = true
            $.each e, (a) ->
            b = objcmp(e[a], c[a])
            i = i and b
            false  unless i

            i

            objkeys = (b) ->
                a = []
            $.each b, (d, c) ->
            a.push d  if b.hasOwnProperty(d)

            a

            objcontains = (c) ->
            return false  if not c or typeof c isnt "object"
            b = 1
            a = arguments_.length

            while b < a
                return true  if c.hasOwnProperty(arguments_[b])
            b++
            false

            uniq = (b) ->
                a = b.length
            d = {}
            c = 0

            while c < a
                d[b[c]] = true
            c++
            objkeys d

            arbor_path = ->
                a = $("script").map((b) ->
                c = $(this).attr("src")
            return  unless c
            c.match(/.*\//) or "/"  if c.match(/arbor[^\/\.]*.js|dev.js/)
            )
            if a.length > 0
                a[0]
            else
                null

            Kernel = (b) -> #     kernel.js
            k = window.location.protocol is "file:" and navigator.userAgent.toLowerCase().indexOf("chrome") > -1
            a = (window.Worker isnt `undefined` and not k)
            i = null
            c = null
            f = []
            f.last = new Date()
            l = null
            e = null
            d = null
            h = null
            g = false
            j =
                system: b
            tween: null
            nodes: {}
            init: ->
            unless typeof (Tween) is "undefined"
            c = Tween()
        else
            unless typeof (arbor.Tween) is "undefined"
            c = arbor.Tween()
        else
            c =
                busy: ->
        false

            tick: ->
            true

            to: ->
            trace "Please include arbor-tween.js to enable tweens"
            c.to = ->

            return
            j.tween = c
            m = b.parameters()
            if a
                trace "arbor.js/web-workers", m
            l = setInterval(j.screenUpdate, m.timeout)
            i = new Worker(arbor_path() + "arbor.js")
            i.onmessage = j.workerMsg
            i.onerror = (n) ->
                trace "physics:", n

            i.postMessage
            type: "physics"
            physics: objmerge(m,
                timeout: Math.ceil(m.timeout)
        )

        else
            trace "arbor.js/single-threaded", m
            i = Physics(m.dt, m.stiffness, m.repulsion, m.friction, j.system._updateGeometry, m.integrator)
            j.start()
            j

            graphChanged: (m) ->
            if a
                i.postMessage
            type: "changes"
            changes: m

        else
            i._update m
            j.start()

            particleModified: (n, m) ->
            if a
                i.postMessage
            type: "modify"
            id: n
            mods: m

        else
            i.modifyNode n, m
            j.start()

            physicsModified: (m) ->
            unless isNaN(m.timeout)
            if a
                clearInterval l
            l = setInterval(j.screenUpdate, m.timeout)
        else
            clearInterval d
            d = null
            if a
                i.postMessage
            type: "sys"
            param: m

        else
            i.modifyPhysics m
            j.start()

            workerMsg: (n) ->
                m = n.data.type
            if m is "geometry"
            j.workerUpdate n.data
        else
            trace "physics:", n.data

            _lastPositions: null
            workerUpdate: (m) ->
                j._lastPositions = m
            j._lastBounds = m.bounds

            _lastFrametime: new Date().valueOf()
            _lastBounds: null
            _currentRenderer: null
            screenUpdate: ->
                n = new Date().valueOf()
            m = false
            if j._lastPositions isnt null
            j.system._updateGeometry j._lastPositions
            j._lastPositions = null
            m = true
            m = true  if c and c.busy()
            m = true  if j.system._updateBounds(j._lastBounds)
            if m
                o = j.system.renderer
            if o isnt `undefined`
            if o isnt e
            o.init j.system
            e = o
            c.tick()  if c
            o.redraw()
            p = f.last
            f.last = new Date()
            f.push f.last - p
            f.shift()  if f.length > 50

            physicsUpdate: ->
            c.tick()  if c
            i.tick()
            n = j.system._updateBounds()
            n = true  if c and c.busy()
            o = j.system.renderer
            m = new Date()
            o = j.system.renderer
            if o isnt `undefined`
          if o isnt e
            o.init j.system
            e = o
            o.redraw timestamp: m
            q = f.last
            f.last = m
            f.push f.last - q
            f.shift()  if f.length > 50
            p = i.systemEnergy()
            if (p.mean + p.max) / 2 < 0.05
            h = new Date().valueOf()  if h is null
            if new Date().valueOf() - h > 1000
                clearInterval d
            d = null
        else
        else
            h = null

            fps: (n) ->
            if n isnt `undefined`
          q = 1000 / Math.max(1, targetFps)
            j.physicsModified timeout: q
            r = 0
            p = 0
            o = f.length

            while p < o
                r += f[p]
            p++
            m = r / Math.max(1, f.length)
            unless isNaN(m)
            Math.round 1000 / m
        else
            0

            start: (m) ->
            return  if d isnt null
            return  if g and not m
            g = false
            if a
                i.postMessage type: "start"
        else
            h = null
            d = setInterval(j.physicsUpdate, j.system.parameters().timeout)

            stop: ->
                g = true
            if a
                i.postMessage type: "stop"
        else
            if d isnt null
            clearInterval d
            d = null

            j.init()

            Node = (a) -> #      atoms.js
            @_id = _nextNodeId++
            @data = a or {}
            @_mass = (if (a.mass isnt `undefined`) then a.mass else 1)
            @_fixed = (if (a.fixed is true) then true else false)
            @_p = new Point((if (typeof (a.x) is "number") then a.x else null), (if (typeof (a.y) is "number") then a.y else null))
            delete @data.x

            delete @data.y

            delete @data.mass

            delete @data.fixed

            _nextNodeId = 1
            Edge = (b, c, a) ->
                @_id = _nextEdgeId--
            @source = b
            @target = c
            @length = (if (a.length isnt `undefined`) then a.length else 1)
            @data = (if (a isnt `undefined`) then a else {})
            delete @data.length

            _nextEdgeId = -1
            Particle = (a, b) ->
                @p = a
            @m = b
            @v = new Point(0, 0)
            @f = new Point(0, 0)

            Particle::applyForce = (a) ->
                @f = @f.add(a.divide(@m))

            Spring = (c, b, d, a) ->
                @point1 = c
            @point2 = b
            @length = d
            @k = a

            Spring::distanceToParticle = (a) ->
                c = that.point2.p.subtract(that.point1.p).normalize().normal()
            b = a.p.subtract(that.point1.p)
            Math.abs b.x * c.x + b.y * c.y

            Point = (a, b) ->
            if a and a.hasOwnProperty("y")
            b = a.y
            a = a.x
            @x = a
            @y = b

            Point.random = (a) ->
                a = (if (a isnt `undefined`) then a else 5)
            new Point(2 * a * (Math.random() - 0.5), 2 * a * (Math.random() - 0.5))

            Point:: =
                exploded: ->
        isNaN(@x) or isNaN(@y)

            add: (a) ->
            new Point(@x + a.x, @y + a.y)

            subtract: (a) ->
            new Point(@x - a.x, @y - a.y)

            multiply: (a) ->
            new Point(@x * a, @y * a)

            divide: (a) ->
            new Point(@x / a, @y / a)

            magnitude: ->
            Math.sqrt @x * @x + @y * @y

            normal: ->
            new Point(-@y, @x)

            normalize: ->
            @divide @magnitude()

            ParticleSystem = (e, r, f, g, u, m, s, a) -> #     system.js
            k = []
            i = null
            l = 0
            v = null
            n = 0.04
            j = [20, 20, 20, 20]
            o = null
            p = null
            if typeof e is "object"
            t = e
            f = t.friction
            e = t.repulsion
            u = t.fps
            m = t.dt
            r = t.stiffness
            g = t.gravity
            s = t.precision
            a = t.integrator
            a = "verlet"  if a isnt "verlet" and a isnt "euler"
            f = (if isNaN(f) then 0.5 else f)
            e = (if isNaN(e) then 1000 else e)
            u = (if isNaN(u) then 55 else u)
            r = (if isNaN(r) then 600 else r)
            m = (if isNaN(m) then 0.02 else m)
            s = (if isNaN(s) then 0.6 else s)
            g = (g is true)
            q = (if (u isnt `undefined`) then 1000 / u else 1000 / 50)
            c =
                integrator: a
            repulsion: e
            stiffness: r
            friction: f
            dt: m
            gravity: g
            precision: s
            timeout: q

            b = undefined
            d =
                renderer: null
            tween: null
            nodes: {}
            edges: {}
            adjacency: {}
            names: {}
            kernel: null

            h =
                parameters: (w) ->
            if w isnt `undefined`
          w.precision = Math.max(0, Math.min(1, w.precision))  unless isNaN(w.precision)
            $.each c, (y, x) ->
            c[y] = w[y]  if w[y] isnt `undefined`

          d.kernel.physicsModified w
            c

            fps: (w) ->
            if w is `undefined`
          d.kernel.fps()
        else
            h.parameters timeout: 1000 / (w or 50)

            start: ->
            d.kernel.start()

            stop: ->
            d.kernel.stop()

            addNode: (z, C) ->
                C = C or {}
            D = d.names[z]
            if D
                D.data = C
            D
        else
            unless z is `undefined`
            w = (if (C.x isnt `undefined`) then C.x else null)
            E = (if (C.y isnt `undefined`) then C.y else null)
            B = (if (C.fixed) then 1 else 0)
            A = new Node(C)
            A.name = z
            d.names[z] = A
            d.nodes[A._id] = A
            k.push
            t: "addNode"
            id: A._id
            m: A.mass
            x: w
            y: E
            f: B

            h._notify()
            A

            pruneNode: (x) ->
                w = h.getNode(x)
            if typeof (d.nodes[w._id]) isnt "undefined"
            delete d.nodes[w._id]

            delete d.names[w.name]
            $.each d.edges, (z, y) ->
            h.pruneEdge y  if y.source._id is w._id or y.target._id is w._id

            k.push
            t: "dropNode"
            id: w._id

            h._notify()

            getNode: (w) ->
            if w._id isnt `undefined`
          w
        else
            d.names[w]  if typeof w is "string" or typeof w is "number"

            eachNode: (w) ->
            $.each d.nodes, (z, y) ->
            return  if not y._p.x? or not y._p.y?
            x = (if (v isnt null) then h.toScreen(y._p) else y._p)
            w.call h, y, x


            addEdge: (A, B, z) ->
                A = h.getNode(A) or h.addNode(A)
            B = h.getNode(B) or h.addNode(B)
            z = z or {}
            y = new Edge(A, B, z)
            C = A._id
            D = B._id
            d.adjacency[C] = d.adjacency[C] or {}
            d.adjacency[C][D] = d.adjacency[C][D] or []
            x = (d.adjacency[C][D].length > 0)
            if x
                $.extend d.adjacency[C][D].data, y.data
            return
        else
            d.edges[y._id] = y
            d.adjacency[C][D].push y
            w = (if (y.length isnt `undefined`) then y.length else 1)
            k.push
            t: "addSpring"
            id: y._id
            fm: C
            to: D
            l: w

            h._notify()
            y

            pruneEdge: (B) ->
            k.push
            t: "dropSpring"
            id: B._id

            delete d.edges[B._id]

            for w of d.adjacency
            for C of d.adjacency[w]
            z = d.adjacency[w][C]
            A = z.length - 1

            while A >= 0
                d.adjacency[w][C].splice A, 1  if d.adjacency[w][C][A]._id is B._id
            A--
            h._notify()

            getEdges: (x, w) ->
                x = h.getNode(x)
            w = h.getNode(w)
            return []  if not x or not w
            return d.adjacency[x._id][w._id]  if typeof (d.adjacency[x._id]) isnt "undefined" and typeof (d.adjacency[x._id][w._id]) isnt "undefined"
            []

            getEdgesFrom: (w) ->
                w = h.getNode(w)
            return []  unless w
            if typeof (d.adjacency[w._id]) isnt "undefined"
            x = []
            $.each d.adjacency[w._id], (z, y) ->
            x = x.concat(y)

            return x
                []

            getEdgesTo: (w) ->
                w = h.getNode(w)
            return []  unless w
            x = []
            $.each d.edges, (z, y) ->
            x.push y  if y.target is w

            x

            eachEdge: (w) ->
            $.each d.edges, (A, y) ->
            z = d.nodes[y.source._id]._p
            x = d.nodes[y.target._id]._p
            return  if not z.x? or not x.x?
            z = (if (v isnt null) then h.toScreen(z) else z)
            x = (if (v isnt null) then h.toScreen(x) else x)
            w.call h, y, z, x  if z and x


            prune: (x) ->
                w = dropped:
            nodes: []
            edges: []

            if x is `undefined`
          $.each d.nodes, (z, y) ->
            w.dropped.nodes.push y
            h.pruneNode y

        else
            h.eachNode (z) ->
                y = x.call(h, z,
                from: h.getEdgesFrom(z)
            to: h.getEdgesTo(z)
        )
            if y
                w.dropped.nodes.push z
            h.pruneNode z

            w

            graft: (x) ->
                w = added:
            nodes: []
            edges: []

            if x.nodes
                $.each x.nodes, (z, y) ->
            A = h.getNode(z)
            if A
                A.data = y
            else
                w.added.nodes.push h.addNode(z, y)
            d.kernel.start()

            if x.edges
                $.each x.edges, (A, y) ->
            z = h.getNode(A)
            w.added.nodes.push h.addNode(A, {})  unless z
            $.each y, (E, B) ->
            D = h.getNode(E)
            w.added.nodes.push h.addNode(E, {})  unless D
            C = h.getEdges(A, E)
            if C.length > 0
                C[0].data = B
            else
                w.added.edges.push h.addEdge(A, E, B)


            w

            merge: (x) ->
                w =
                added:
            nodes: []
            edges: []

            dropped:
                nodes: []
            edges: []

            $.each d.edges, (B, A) ->
            if x.edges[A.source.name] is `undefined` or x.edges[A.source.name][A.target.name] is `undefined`
            h.pruneEdge A
            w.dropped.edges.push A

            z = h.prune((B, A) ->
            if x.nodes[B.name] is `undefined`
            w.dropped.nodes.push B
            true
        )
            y = h.graft(x)
            w.added.nodes = w.added.nodes.concat(y.added.nodes)
            w.added.edges = w.added.edges.concat(y.added.edges)
            w.dropped.nodes = w.dropped.nodes.concat(z.dropped.nodes)
            w.dropped.edges = w.dropped.edges.concat(z.dropped.edges)
            w

            tweenNode: (z, w, y) ->
                x = h.getNode(z)
            d.tween.to x, w, y  if x

            tweenEdge: (x, w, A, z) ->
            if z is `undefined`
          h._tweenEdge x, w, A
        else
            y = h.getEdges(x, w)
            $.each y, (B, C) ->
            h._tweenEdge C, A, z


            _tweenEdge: (x, w, y) ->
            d.tween.to x, w, y  if x and x._id isnt `undefined`

      _updateGeometry: (z) ->
      unless z is `undefined`
          w = (z.epoch < l)
            b = z.energy
            A = z.geometry
            if A isnt `undefined`
            y = 0
            x = A.length / 3

            while y < x
                B = A[3 * y]
            continue  if w and d.nodes[B] is `undefined`
              d.nodes[B]._p.x = A[3 * y + 1]
            d.nodes[B]._p.y = A[3 * y + 2]
            y++

            screen: (w) ->
            if w is `undefined`
          return (
              size: (if (v) then objcopy(v) else `undefined`)
            padding: j.concat()
            step: n
        )
            h.screenSize w.size.width, w.size.height  if w.size isnt `undefined`
        h.screenStep w.step  unless isNaN(w.step)
            h.screenPadding w.padding  if w.padding isnt `undefined`

      screenSize: (w, x) ->
          v =
          width: w
            height: x

            h._updateBounds()

            screenPadding: (z, A, w, x) ->
            if $.isArray(z)
                trbl = z
            else
                trbl = [z, A, w, x]
            B = trbl[0]
            y = trbl[1]
            C = trbl[2]
            if y is `undefined`
          trbl = [B, B, B, B]
        else
            trbl = [B, y, B, y]  if C is `undefined`
        j = trbl

            screenStep: (w) ->
                n = w

            toScreen: (y) ->
            return  if not o or not v
            x = j or [0, 0, 0, 0]
            w = o.bottomright.subtract(o.topleft)
            A = x[3] + y.subtract(o.topleft).divide(w.x).x * (v.width - (x[1] + x[3]))
            z = x[0] + y.subtract(o.topleft).divide(w.y).y * (v.height - (x[0] + x[2]))
            arbor.Point A, z

            fromScreen: (A) ->
            return  if not o or not v
            z = j or [0, 0, 0, 0]
            y = o.bottomright.subtract(o.topleft)
            x = (A.x - z[3]) / (v.width - (z[1] + z[3])) * y.x + o.topleft.x
            w = (A.y - z[0]) / (v.height - (z[0] + z[2])) * y.y + o.topleft.y
            arbor.Point x, w

            _updateBounds: (x) ->
            return  if v is null
            if x
                p = x
            else
                p = h.bounds()
            A = new Point(p.bottomright.x, p.bottomright.y)
            z = new Point(p.topleft.x, p.topleft.y)
            C = A.subtract(z)
            w = z.add(C.divide(2))
            y = 4
            E = new Point(Math.max(C.x, y), Math.max(C.y, y))
            p.topleft = w.subtract(E.divide(2))
            p.bottomright = w.add(E.divide(2))
            unless o
            return false  if $.isEmptyObject(d.nodes)
            o = p
            return true
            D = n
            _newBounds =
                bottomright: o.bottomright.add(p.bottomright.subtract(o.bottomright).multiply(D))
            topleft: o.topleft.add(p.topleft.subtract(o.topleft).multiply(D))

            B = new Point(o.topleft.subtract(_newBounds.topleft).magnitude(), o.bottomright.subtract(_newBounds.bottomright).magnitude())
            if B.x * v.width > 1 or B.y * v.height > 1
            o = _newBounds
            true
        else
            false

            energy: ->
            b

            bounds: ->
                x = null
            w = null
            $.each d.nodes, (A, z) ->
            unless x
            x = new Point(z._p)
            w = new Point(z._p)
            return
            y = z._p
            return  if y.x is null or y.y is null
            x.x = y.x  if y.x > x.x
            x.y = y.y  if y.y > x.y
            w.x = y.x  if y.x < w.x
            w.y = y.y  if y.y < w.y

            if x and w
            bottomright: x
            topleft: w
        else
            topleft: new Point(-1, -1)
            bottomright: new Point(1, 1)

            nearest: (y) ->
                y = h.fromScreen(y)  if v isnt null
            x =
                node: null
            point: null
            distance: null

            w = h
            $.each d.nodes, (C, z) ->
            A = z._p
            return  if A.x is null or A.y is null
            B = A.subtract(y).magnitude()
            if x.distance is null or B < x.distance
            x =
                node: z
            point: A
            distance: B

            x.screenPoint = h.toScreen(A)  if v isnt null

            if x.node
                x.distance = h.toScreen(x.node.p).subtract(h.toScreen(y)).magnitude()  if v isnt null
            x
        else
            null

            _notify: ->
            if i is null
            l++
        else
            clearTimeout i
            i = setTimeout(h._synchronize, 20)

            _synchronize: ->
            if k.length > 0
                d.kernel.graphChanged k
            k = []
            i = null

            d.kernel = Kernel(h)
            d.tween = d.kernel.tween or null
            Node::__defineGetter__ "p", ->
            x = this
            w = {}
            w.__defineGetter__ "x", ->
            x._p.x

            w.__defineSetter__ "x", (y) ->
            d.kernel.particleModified x._id,
            x: y


            w.__defineGetter__ "y", ->
            x._p.y

            w.__defineSetter__ "y", (y) ->
            d.kernel.particleModified x._id,
            y: y


            w.__proto__ = Point::
                w

            Node::__defineSetter__ "p", (w) ->
            @_p.x = w.x
            @_p.y = w.y
            d.kernel.particleModified @_id,
            x: w.x
            y: w.y


            Node::__defineGetter__ "mass", ->
            @_mass

            Node::__defineSetter__ "mass", (w) ->
            @_mass = w
            d.kernel.particleModified @_id,
            m: w


            Node::__defineSetter__ "tempMass", (w) ->
            d.kernel.particleModified @_id,
            _m: w


            Node::__defineGetter__ "fixed", ->
            @_fixed

            Node::__defineSetter__ "fixed", (w) ->
            @_fixed = w
            d.kernel.particleModified @_id,
            f: (if w then 1 else 0)


            h

            BarnesHutTree = -> # barnes-hut.js
            b = []
            a = 0
            e = null
            d = 0.5
            c =
                init: (g, h, f) ->
            d = f
            a = 0
            e = c._newBranch()
            e.origin = g
            e.size = h.subtract(g)

            insert: (j) ->
                f = e
            g = [j]
            while g.length
                h = g.shift()
            m = h._m or h.m
            p = c._whichQuad(h, f)
            if f[p] is `undefined`
            f[p] = h
            f.mass += m
            if f.p
                f.p = f.p.add(h.p.multiply(m))
            else
                f.p = h.p.multiply(m)
        else
            if "origin" of f[p]
            f.mass += (m)
            if f.p
                f.p = f.p.add(h.p.multiply(m))
            else
                f.p = h.p.multiply(m)
            f = f[p]
            g.unshift h
        else
            l = f.size.divide(2)
            n = new Point(f.origin)
            n.y += l.y  if p[0] is "s"
            n.x += l.x  if p[1] is "e"
            o = f[p]
            f[p] = c._newBranch()
            f[p].origin = n
            f[p].size = l
            f.mass = m
            f.p = h.p.multiply(m)
            f = f[p]
            if o.p.x is h.p.x and o.p.y is h.p.y
            k = l.x * 0.08
            i = l.y * 0.08
            o.p.x = Math.min(n.x + l.x, Math.max(n.x, o.p.x - k / 2 + Math.random() * k))
            o.p.y = Math.min(n.y + l.y, Math.max(n.y, o.p.y - i / 2 + Math.random() * i))
            g.push o
            g.unshift h

            applyForces: (m, g) ->
                f = [e]
            while f.length
                node = f.shift()
            continue  if node is `undefined`
          continue  if m is node
            if "f" of node
            k = m.p.subtract(node.p)
            l = Math.max(1, k.magnitude())
            i = ((if (k.magnitude() > 0) then k else Point.random(1))).normalize()
            m.applyForce i.multiply(g * (node._m or node.m)).divide(l * l)
        else
            j = m.p.subtract(node.p.divide(node.mass)).magnitude()
            h = Math.sqrt(node.size.x * node.size.y)
            if h / j > d
                f.push node.ne
            f.push node.nw
            f.push node.se
            f.push node.sw
        else
            k = m.p.subtract(node.p.divide(node.mass))
            l = Math.max(1, k.magnitude())
            i = ((if (k.magnitude() > 0) then k else Point.random(1))).normalize()
            m.applyForce i.multiply(g * (node.mass)).divide(l * l)

            _whichQuad: (i, f) ->
            return null  if i.p.exploded()
            h = i.p.subtract(f.origin)
            g = f.size.divide(2)
            if h.y < g.y
                if h.x < g.x
                    "nw"
                else
                    "ne"
            else
            if h.x < g.x
                "sw"
            else
                "se"

            _newBranch: ->
            if b[a]
                f = b[a]
            f.ne = f.nw = f.se = f.sw = `undefined`
          f.mass = 0
            delete f.p
        else
            f =
                origin: null
            size: null
            nw: `undefined`
            ne: `undefined`
            sw: `undefined`
            se: `undefined`
            mass: 0

            b[a] = f
            a++
            f

            c

            Physics = (a, m, n, e, h, o) -> #    physics.js
            f = BarnesHutTree()
            c =
                particles: {}
            springs: {}

            l = particles: {}
            p = []
            k = []
            d = 0
            b =
                sum: 0
            max: 0
            mean: 0

            g =
                topleft: new Point(-1, -1)
            bottomright: new Point(1, 1)

            j = 1000
            i =
                integrator: (if ["verlet", "euler"].indexOf(o) >= 0 then o else "verlet")
            stiffness: (if (m isnt `undefined`) then m else 1000)
            repulsion: (if (n isnt `undefined`) then n else 600)
            friction: (if (e isnt `undefined`) then e else 0.3)
            gravity: false
            dt: (if (a isnt `undefined`) then a else 0.02)
            theta: 0.4
            init: ->
            i

            modifyPhysics: (q) ->
                $.each ["stiffness", "repulsion", "friction", "gravity", "dt", "precision", "integrator"], (s, t) ->
            if q[t] isnt `undefined`
            if t is "precision"
            i.theta = 1 - q[t]
            return
            i[t] = q[t]
            if t is "stiffness"
            r = q[t]
            $.each c.springs, (v, u) ->
            u.k = r



            addNode: (v) ->
                u = v.id
            r = v.m
            q = g.bottomright.x - g.topleft.x
            t = g.bottomright.y - g.topleft.y
            s = new Point((if (v.x?) then v.x else g.topleft.x + q * Math.random()), (if (v.y?) then v.y else g.topleft.y + t * Math.random()))
            c.particles[u] = new Particle(s, r)
            c.particles[u].connections = 0
            c.particles[u].fixed = (v.f is 1)
            l.particles[u] = c.particles[u]
            p.push c.particles[u]

            dropNode: (t) ->
                s = t.id
            r = c.particles[s]
            q = $.inArray(r, p)
            p.splice q, 1  if q > -1
            delete c.particles[s]

            delete l.particles[s]

            modifyNode: (s, q) ->
            if s of c.particles
            r = c.particles[s]
            r.p.x = q.x  if "x" of q
            r.p.y = q.y  if "y" of q
            r.m = q.m  if "m" of q
            r.fixed = (q.f is 1)  if "f" of q
            if "_m" of q
            r._m = r.m  if r._m is `undefined`
            r.m = q._m

            addSpring: (u) ->
                t = u.id
            q = u.l
            s = c.particles[u.fm]
            r = c.particles[u.to]
            if s isnt `undefined` and r isnt `undefined`
          c.springs[t] = new Spring(s, r, q, i.stiffness)
            k.push c.springs[t]
            s.connections++
            r.connections++
            delete l.particles[u.fm]

            delete l.particles[u.to]

            dropSpring: (t) ->
                s = t.id
            r = c.springs[s]
            r.point1.connections--
            r.point2.connections--
            q = $.inArray(r, k)
            k.splice q, 1  if q > -1
            delete c.springs[s]

            _update: (q) ->
            d++
            $.each q, (r, s) ->
            i[s.t] s  if s.t of i

            d

            tick: ->
            i.tendParticles()
            if i.integrator is "euler"
            i.updateForces()
            i.updateVelocity i.dt
            i.updatePosition i.dt
        else
            i.updateForces()
            i.cacheForces()
            i.updatePosition i.dt
            i.updateForces()
            i.updateVelocity i.dt
            i.tock()

            tock: ->
                q = []
            $.each c.particles, (s, r) ->
            q.push s
            q.push r.p.x
            q.push r.p.y

            if h
                h
            geometry: q
            epoch: d
            energy: b
            bounds: g


            tendParticles: ->
            $.each c.particles, (r, q) ->
            if q._m isnt `undefined`
            if Math.abs(q.m - q._m) < 1
                q.m = q._m
            delete q._m
        else
            q.m *= 0.98
            q.v.x = q.v.y = 0


            updateForces: ->
            if i.repulsion > 0
                if i.theta > 0
                    i.applyBarnesHutRepulsion()
                else
                    i.applyBruteForceRepulsion()
            i.applySprings()  if i.stiffness > 0
            i.applyCenterDrift()
            i.applyCenterGravity()  if i.gravity

            cacheForces: ->
            $.each c.particles, (r, q) ->
            q._F = q.f


            applyBruteForceRepulsion: ->
            $.each c.particles, (r, q) ->
            $.each c.particles, (t, s) ->
            if q isnt s
            v = q.p.subtract(s.p)
            w = Math.max(1, v.magnitude())
            u = ((if (v.magnitude() > 0) then v else Point.random(1))).normalize()
            q.applyForce u.multiply(i.repulsion * (s._m or s.m) * 0.5).divide(w * w * 0.5)
            s.applyForce u.multiply(i.repulsion * (q._m or q.m) * 0.5).divide(w * w * -0.5)



            applyBarnesHutRepulsion: ->
            return  if not g.topleft or not g.bottomright
            r = new Point(g.bottomright)
            q = new Point(g.topleft)
            f.init q, r, i.theta
            $.each c.particles, (t, s) ->
            f.insert s

            $.each c.particles, (t, s) ->
            f.applyForces s, i.repulsion


            applySprings: ->
            $.each c.springs, (u, q) ->
            t = q.point2.p.subtract(q.point1.p)
            r = q.length - t.magnitude()
            s = ((if (t.magnitude() > 0) then t else Point.random(1))).normalize()
            q.point1.applyForce s.multiply(q.k * r * -0.5)
            q.point2.applyForce s.multiply(q.k * r * 0.5)


            applyCenterDrift: ->
                r = 0
            s = new Point(0, 0)
            $.each c.particles, (u, t) ->
            s.add t.p
            r++

            return  if r is 0
            q = s.divide(-r)
            $.each c.particles, (u, t) ->
            t.applyForce q


            applyCenterGravity: ->
            $.each c.particles, (s, q) ->
            r = q.p.multiply(-1)
            q.applyForce r.multiply(i.repulsion / 100)


            updateVelocity: (r) ->
                s = 0
            q = 0
            t = 0
            $.each c.particles, (x, u) ->
            if u.fixed
                u.v = new Point(0, 0)
            u.f = new Point(0, 0)
            return
            if i.integrator is "euler"
            u.v = u.v.add(u.f.multiply(r)).multiply(1 - i.friction)
        else
            u.v = u.v.add(u.f.add(u._F.divide(u._m)).multiply(r * 0.5)).multiply(1 - i.friction)
            u.f.x = u.f.y = 0
            v = u.v.magnitude()
            u.v = u.v.divide(v * v)  if v > j
            v = u.v.magnitude()
            w = v * v
            s += w
            q = Math.max(w, q)
            t++

            b =
                sum: s
            max: q
            mean: s / t
            n: t

            updatePosition: (q) ->
                s = null
            r = null
            $.each c.particles, (v, u) ->
            if i.integrator is "euler"
            u.p = u.p.add(u.v.multiply(q))
        else
            t = u.f.multiply(0.5 * q * q).divide(u.m)
            u.p = u.p.add(u.v.multiply(q)).add(t)
            unless s
            s = new Point(u.p.x, u.p.y)
            r = new Point(u.p.x, u.p.y)
            return
            w = u.p
            return  if w.x is null or w.y is null
            s.x = w.x  if w.x > s.x
            s.y = w.y  if w.y > s.y
            r.x = w.x  if w.x < r.x
            r.y = w.y  if w.y < r.y

            g =
                topleft: r or new Point(-1, -1)
            bottomright: s or new Point(1, 1)

            systemEnergy: (q) ->
            b

            i.init()

            _nearParticle = (b, c) ->
                c = c or 0
            a = b.x
            f = b.y
            e = c * 2
            new Point(a - c + Math.random() * e, f - c + Math.random() * e)

  
  # if called as a worker thread, set up a run loop for the Physics object and bail out
            if typeof (window) is "undefined"
            return (->
                $ = # hermetic.js
            each: (d, e) ->
            if $.isArray(d)
                c = 0
            b = d.length

            while c < b
                e c, d[c]
            c++
        else
            for a of d
            e a, d[a]

            map: (a, c) ->
                b = []
            $.each a, (f, e) ->
            d = c(e)
            b.push d  if d isnt `undefined`

          b

            extend: (c, b) ->
            return c  unless typeof b is "object"
            for a of b
            c[a] = b[a]  if b.hasOwnProperty(a)
            c

            isArray: (a) ->
            return false  unless a
            a.constructor.toString().indexOf("Array") isnt -1

            inArray: (c, a) ->
                d = 0
            b = a.length

            while d < b
                return d  if a[d] is c
            d++
            -1

            isEmptyObject: (a) ->
            return false  if typeof a isnt "object"
            b = true
            $.each a, (c, d) ->
            b = false

            b

            PhysicsWorker = -> #     worker.js
            b = 20
            a = null
            d = null
            c = null
            g = []
            f = new Date().valueOf()
            e =
                init: (h) ->
        e.timeout h.timeout
            a = Physics(h.dt, h.stiffness, h.repulsion, h.friction, e.tock)
            e

            timeout: (h) ->
            unless h is b
            b = h
            if d isnt null
            e.stop()
            e.go()

            go: ->
            return  if d isnt null
            c = null
            d = setInterval(e.tick, b)

            stop: ->
            return  if d is null
            clearInterval d
            d = null

            tick: ->
            a.tick()
            h = a.systemEnergy()
            if (h.mean + h.max) / 2 < 0.05
            c = new Date().valueOf()  if c is null
            if new Date().valueOf() - c > 1000
                e.stop()
            else
            else
            c = null

            tock: (h) ->
                h.type = "geometry"
            postMessage h

            modifyNode: (i, h) ->
            a.modifyNode i, h
            e.go()

            modifyPhysics: (h) ->
            a.modifyPhysics h

            update: (h) ->
                i = a._update(h)

            e

            physics = PhysicsWorker()
            onmessage = (a) ->
                unless a.data.type
            postMessage "¿kérnèl?"
            return
            if a.data.type is "physics"
            b = a.data.physics
            physics.init a.data.physics
            return
            switch a.data.type
                when "modify"
                    physics.modifyNode a.data.id, a.data.mods
                    when "changes"
                    physics.update a.data.changes
                    physics.go()
                    when "start"
                    physics.go()
                    when "stop"
                    physics.stop()
                    when "sys"
                    b = a.data.param or {}
                    physics.timeout b.timeout  unless isNaN(b.timeout)
                    physics.modifyPhysics b
                    physics.go()
                )()
                    arbor = (if (typeof (arbor) isnt "undefined") then arbor else {})
                    $.extend arbor,
    
    # object constructors (don't use ‘new’, just call them)
                    ParticleSystem: ParticleSystem
                    Point: (x, y) ->
                    new Point(x, y)

    
    # immutable object with useful methods
                    etc:
                        trace: trace # ƒ(msg) -> safe console logging
                    dirname: dirname # ƒ(path) -> leading part of path
                    basename: basename # ƒ(path) -> trailing part of path
                    ordinalize: ordinalize # ƒ(num) -> abbrev integers (and add commas)
                    objcopy: objcopy # ƒ(old) -> clone an object
                    objcmp: objcmp # ƒ(a, b, strict_ordering) -> t/f comparison
                    objkeys: objkeys # ƒ(obj) -> array of all keys in obj
                    objmerge: objmerge # ƒ(dst, src) -> like $.extend but non-destructive
                    uniq: uniq # ƒ(arr) -> array of unique items in arr
                    arbor_path: arbor_path # ƒ() -> guess the directory of the lib code

                ) @jQuery