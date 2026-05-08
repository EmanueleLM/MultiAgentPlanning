(define (domain blocksworld-scaling2)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (phase ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Pick up a clear block from the table when the current stage is ?s
  ;; and advance to the explicit successor stage ?s1.
  (:action pickup
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))    ;; a held block is not clear by definition
              (not (handempty))
              (holding ?b)
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Unstack a clear block ?b from on top of ?c when the current stage is ?s
  ;; and advance to the explicit successor stage ?s1.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and
                    (on ?b ?c)
                    (clear ?b)
                    (handempty)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (not (on ?b ?c))
              (holding ?b)
              (not (handempty))
              (clear ?c)         ;; lower block becomes clear after removing top
              (not (clear ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Put down a held block onto the table, advancing from stage ?s to ?s1.
  (:action putdown
    :parameters (?b - block ?s - stage ?s1 - stage)
    :precondition (and
                    (holding ?b)
                    (phase ?s)
                    (next ?s ?s1))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (phase ?s))
              (phase ?s1))
  )

  ;; Stack a held block ?b onto a clear block ?c, advancing from ?s to ?s1.
  ;; Disallow creating a two-block-cycle by ensuring ?c is not on ?b.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s1 - stage)
    :precondition (and
                    (holding ?b)
                    (clear ?c)
                    (phase ?s)
                    (next ?s ?s1)
                    (not (on ?c ?b)))
    :effect (and
              (on ?b ?c)
              (not (holding ?b))
              (handempty)
              (not (clear ?c))   ;; lower block is no longer clear
              (clear ?b)
              (not (phase ?s))
              (phase ?s1))
  )
)