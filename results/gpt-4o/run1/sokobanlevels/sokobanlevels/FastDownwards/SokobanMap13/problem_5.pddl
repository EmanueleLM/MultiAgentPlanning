(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    player1 - agent
    box1 - box
    ; Define all positions encountered in the map including player, box, and goal positions.
    p1 p2 p3 p98 p99 - position
  )
  (:init
    ; Assume initial and goal positions per problem map and description.
    (at player1 p1)
    (at-box box1 p98)
    (clear p99)
    ; Define positional adjacencies reflecting map layout precisely.
    (adjacent p1 p2)
    (adjacent p2 p3)
    (adjacent p3 p98)
    (adjacent p98 p99)
  )
  (:goal
    (at-box box1 p99)
  )
)