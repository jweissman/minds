$(document).ready ->
  $( "#sortable" ).sortable()

##(($) ->
#  $(document).ready ->
#    sys = arbor.ParticleSystem(1000, 600, 0.5) # create the system with sensible repulsion/stiffness/friction
#    sys.parameters gravity: true # use center-gravity to make the graph settle nicely (ymmv)
#    sys.renderer = Renderer("#viewport") # our newly created renderer will have its .init() method called shortly by sys...
#
#    # add some nodes to the graph and watch it go...
#    sys.addEdge "a", "b"
#    sys.addEdge "a", "c"
#    sys.addEdge "a", "d"
#    sys.addEdge "a", "e"
#    sys.addNode "f",
#      alone: true
#      mass: .25
#
#
#
#  # or, equivalently:
#  #
#  # sys.graft({
#  #   nodes:{
#  #     f:{alone:true, mass:.25}
#  #   },
#  #   edges:{
#  #     a:{ b:{},
#  #         c:{},
#  #         d:{},
#  #         e:{}
#  #     }
#  #   }
#  # })
#) @jQuery