(define (domain blocks-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (handempty ?a - agent)
    (holding ?a - agent ?b - block)
    (on ?b - block ?c - block)      ; block b is directly on block c
    (on-table ?b - block)           ; block b is on the table
    (clear ?b - block)              ; no block on top of b and b is not being held
    (at-stage ?a - agent ?s - stage) ; agent is at a particular stage/time
    (succ ?s - stage ?s2 - stage)   ; s2 is the immediate successor of s
  )

  ;; Pick up a clear block from the table (hand must be empty).
  ;; Advances the agent to the successor stage (enforces ordered discrete time).
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

  ;; Unstack a clear block from on top of another block (hand must be empty).
  ;; The block below becomes clear after removing the top block.
  ;; Advances the agent to the successor stage.
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

  ;; Put down a held block onto the table.
  ;; Advances the agent to the successor stage.
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

  ;; Stack a held block onto a clear destination block.
  ;; Destination becomes not clear; the stacked block becomes clear (topmost).
  ;; Advances the agent to the successor stage.
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