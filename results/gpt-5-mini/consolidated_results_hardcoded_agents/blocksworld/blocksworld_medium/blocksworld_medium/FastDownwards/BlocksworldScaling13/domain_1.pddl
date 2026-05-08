(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?c - block)        ; block b is on block c
    (on-table ?b - block)             ; block is on the table
    (clear ?b - block)                ; nothing on top of block (and not being held)
    (holding ?ag - agent ?b - block)  ; agent holding block
    (handempty ?ag - agent)           ; agent's hand is empty
    (current ?t - step)               ; current global stage/time
    (next ?t - step ?t2 - step)       ; successor relation between stages (static)
  )

  ;; Pick up a clear block from the table (one action consumes one stage)
  (:action pick-up-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (on-table ?b)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (on-table ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (clear ?b))        ; held block is not considered clear
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Unstack a clear block from another block (one action consumes one stage)
  (:action unstack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (on ?b ?c)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (on ?b ?c))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c)              ; lower block becomes clear after unstack
              (not (clear ?b))        ; held block not clear
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Put down a held block onto the table (one action consumes one stage)
  (:action put-down-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
                    (holding ?ag ?b)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (on-table ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (clear ?b)              ; block on table with nothing on top is clear
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Stack a held block onto a clear block (one action consumes one stage)
  (:action stack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c)
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))       ; target block no longer clear
              (clear ?b)             ; stacked block is clear (nothing on top)
              (not (current ?t))
              (current ?t2)
            )
  )
)