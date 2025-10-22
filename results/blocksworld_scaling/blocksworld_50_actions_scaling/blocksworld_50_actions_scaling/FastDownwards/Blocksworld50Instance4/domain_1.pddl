(define (domain blocks-world-multiagent)
  (:requirements :strips :typing)
  (:types block robot)

  (:predicates
    (on ?b - block ?under - block)    ;; ?b is immediately on ?under (both blocks)
    (ontable ?b - block)              ;; ?b is on the table
    (clear ?b - block)                ;; nothing on top of ?b
    (holding ?r - robot ?b - block)   ;; robot ?r holds block ?b
    (handempty ?r - robot)            ;; robot ?r has empty hand
  )

  ;; Unstack block ?b from block ?c (robot picks ?b from ?c)
  (:action unstack
    :parameters (?r - robot ?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty ?r))
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (holding ?r ?b)
      (clear ?c)
      (not (handempty ?r))
    )
  )

  ;; Pickup a block from the table
  (:action pickup-from-table
    :parameters (?r - robot ?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty ?r))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding ?r ?b)
      (not (handempty ?r))
    )
  )

  ;; Put held block ?b onto block ?c
  (:action put-on-block
    :parameters (?r - robot ?b - block ?c - block)
    :precondition (and (holding ?r ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (not (holding ?r ?b))
      (handempty ?r)
    )
  )

  ;; Put held block ?b down on the table
  (:action put-on-table
    :parameters (?r - robot ?b - block)
    :precondition (holding ?r ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?r ?b))
      (handempty ?r)
    )
  )
)