(define (domain blocks_world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage surface)

  (:predicates
    ;; block placement: a block can be on another block or on a surface (table)
    (on ?x - block ?y - (either block surface))
    (clear ?x - block)           ; no block on top of ?x and ?x is not held
    (holding ?x - block)         ; hand holds ?x
    (handempty)                  ; hand is empty
    (at-stage ?t - stage)        ; current discrete stage/timepoint
    (succ ?t - stage ?t2 - stage); successor relation between stages
    (is-table ?s - surface)      ; marks the surface object that is the table
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions (namespaced as "lp-" from local_planner). Each action
  ;; consumes one stage and produces the successor stage. This enforces
  ;; explicit ordered progression and prevents oscillation/backtracking.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; lp-pickup: pick up a clear block from a surface (table)
  (:action lp-pickup
    :parameters (?b - block ?s - surface ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (on ?b ?s))
      (not (clear ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;;; lp-unstack: remove a clear block ?b from on top of block ?below
  (:action lp-unstack
    :parameters (?b - block ?below - block ?t - stage ?t2 - stage)
    :precondition (and
      (handempty)
      (on ?b ?below)
      (clear ?b)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (not (clear ?b))
      (clear ?below)        ; once ?b removed, the supporting block becomes clear
      (not (handempty))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;;; lp-putdown: put a held block onto the table (surface marked by is-table)
  (:action lp-putdown
    :parameters (?b - block ?s - surface ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (is-table ?s)          ; restrict putdown to the table surface
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )

  ;;; lp-stack: place a held block ?b onto block ?dest (dest must be clear)
  (:action lp-stack
    :parameters (?b - block ?dest - block ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (clear ?dest)
      (at-stage ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (on ?b ?dest)
      (not (clear ?dest))   ; destination no longer clear once something is stacked on it
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (at-stage ?t))
      (at-stage ?t2)
    )
  )
)