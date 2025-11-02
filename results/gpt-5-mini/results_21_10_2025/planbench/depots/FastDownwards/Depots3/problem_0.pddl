(define (problem combined-scenario)
  (:domain multiagent-delivery)
  (:objects
    p1 p2 - agent
    locA locB locC locD - location
    key1 pkg1 box1 - object
  )

  (:init
    ;; Agent locations
    (at-agent p1 locA)
    (at-agent p2 locB)

    ;; Object locations
    (at-obj key1 locA)
    (at-obj pkg1 locA)
    (at-obj box1 locC)

    ;; No one is holding any object initially (omitted because holding facts are false by default)

    ;; Adjacency (bidirectional)
    (adj locA locB)
    (adj locB locA)
    (adj locB locC)
    (adj locC locB)
    (adj locC locD)
    (adj locD locC)

    ;; Blocked passage between locB and locC initially (locked door)
    (blocked locB locC)
    (blocked locC locB)
  )

  (:goal (and
    ;; Player1's/Player2's combined goals:
    ;; - deliver pkg1 to locD
    ;; - bring box1 to locB
    (at-obj pkg1 locD)
    (at-obj box1 locB)
  ))
)