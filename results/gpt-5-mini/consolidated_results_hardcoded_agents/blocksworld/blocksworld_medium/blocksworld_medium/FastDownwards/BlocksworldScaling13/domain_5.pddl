(define (domain blocks-world-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?c - block)        ; block b is on block c
    (on-table ?b - block)             ; block is on the table
    (clear ?b - block)                ; nothing on top of block and block is not being held
    (holding ?ag - agent ?b - block)  ; agent holding block
    (handempty ?ag - agent)           ; agent's hand is empty
    (current ?t - step)               ; current global stage/time
    (next ?t - step ?t2 - step)       ; successor relation between stages (static)
  )

  ;; Pick up a clear block from the table (advances stage from ?t to its successor ?t2)
  (:action pick-up-agent
    :parameters (?ag - agent ?b - block ?t - step ?t2 - step)
    :precondition (and
                    (handempty ?ag)
                    (on-table ?b)
                    (clear ?b)
                    (not (holding ?ag ?b))
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (on-table ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (clear ?b))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Unstack a clear block ?b from on top of another block ?c (advances stage)
  (:action unstack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
                    (handempty ?ag)
                    (on ?b ?c)
                    (clear ?b)
                    (not (holding ?ag ?b))
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (on ?b ?c))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?c)
              (not (clear ?b))
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Put down a held block onto the table (advances stage)
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
              (clear ?b)
              (not (current ?t))
              (current ?t2)
            )
  )

  ;; Stack a held block onto a clear block (advances stage)
  (:action stack-agent
    :parameters (?ag - agent ?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?c)
                    (not (holding ?ag ?c))
                    (current ?t)
                    (next ?t ?t2)
                  )
    :effect (and
              (not (holding ?ag ?b))
              (handempty ?ag)
              (on ?b ?c)
              (not (clear ?c))
              (clear ?b)
              (not (current ?t))
              (current ?t2)
            )
  )
)