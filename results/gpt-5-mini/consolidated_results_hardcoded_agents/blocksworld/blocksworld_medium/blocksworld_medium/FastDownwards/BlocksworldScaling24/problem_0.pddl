(define (problem stack-sequence-red-blue-orange-yellow)
  (:domain blocks-multiagent-orchestrator)
  (:objects
    red blue orange yellow - block
    p0 p1 p2 p3 - phase
  )

  (:init
    ;; All blocks start on the table and are clear
    (ontable red)
    (ontable blue)
    (ontable orange)
    (ontable yellow)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    ;; hand is free at start
    (handempty)

    ;; Allowed stacking pairs and the phase in which they must occur
    ;; Enforce the required ordered sequence via phases:
    ;; - orange on yellow must be done in phase p0 -> advances to p1
    ;; - blue on orange must be done in phase p1 -> advances to p2
    ;; - red on blue must be done in phase p2 -> advances to p3
    (allowed orange yellow p0)
    (allowed blue orange p1)
    (allowed red blue p2)

    ;; Phase successor links to enforce ordering and contiguity
    (next p0 p1)
    (next p1 p2)
    (next p2 p3)

    ;; Start in the first phase only
    (current-phase p0)
  )

  (:goal (and
           (on red blue)
           (on blue orange)
           (on orange yellow)
           ;; Final terminal condition: the system must have advanced to final phase
           (current-phase p3)
           ;; Hand must be empty at the end (explicit terminal condition)
           (handempty)
         ))