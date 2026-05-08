(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (on ?b - block ?c - block)
    (on-table ?b - block)
    (clear ?b - block)
    (at-stage ?a - agent ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; PickUp: pick a clear block from the table while hand is empty and advance agent stage.
  (:action pickup
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (handempty ?ag)
                    (on-table ?b)
                    (clear ?b)
                    (at-stage ?ag ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (handempty ?ag))
              (holding ?ag ?b)
              (not (on-table ?b))
              (not (clear ?b))
              (not (at-stage ?ag ?s))
              (at-stage ?ag ?s2)
            )
  )

  ;; Unstack: pick a clear block that is on another block while hand is empty; the block below becomes clear.
  (:action unstack
    :parameters (?ag - agent ?b - block ?below - block ?s - stage ?s2 - stage)
    :precondition (and
                    (handempty ?ag)
                    (on ?b ?below)
                    (clear ?b)
                    (at-stage ?ag ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?below)
              (not (on ?b ?below))
              (not (clear ?b))
              (not (at-stage ?ag ?s))
              (at-stage ?ag ?s2)
            )
  )

  ;; PutDown: put a held block onto the table; hand becomes empty and the block is clear.
  (:action putdown
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (at-stage ?ag ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (handempty ?ag)
              (not (holding ?ag ?b))
              (on-table ?b)
              (clear ?b)
              (not (at-stage ?ag ?s))
              (at-stage ?ag ?s2)
            )
  )

  ;; Stack: place a held block onto a clear destination block; destination becomes not clear.
  (:action stack
    :parameters (?ag - agent ?b - block ?dest - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?dest)
                    (at-stage ?ag ?s)
                    (succ ?s ?s2)
                  )
    :effect (and
              (handempty ?ag)
              (not (holding ?ag ?b))
              (on ?b ?dest)
              (not (clear ?dest))
              (clear ?b)
              (not (on-table ?b))
              (not (at-stage ?ag ?s))
              (at-stage ?ag ?s2)
            )
  )
)