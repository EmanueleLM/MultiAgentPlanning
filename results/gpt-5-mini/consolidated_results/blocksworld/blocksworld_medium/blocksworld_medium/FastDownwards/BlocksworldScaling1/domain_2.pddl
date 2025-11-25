(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage block surface)
  ;; block and surface are both kinds of places where blocks can be placed
  (:constraints )
  (:predicates
    (on ?b - block ?p - place)      ; block ?b is on place ?p (block or surface)
    (clear ?b - block)              ; no block on top of ?b and ?b is not held
    (holding ?b - block)            ; the single hand holds ?b
    (handempty)                     ; the single hand is empty
    (at-stage ?t - stage)           ; current discrete stage/timepoint
    (succ ?t - stage ?t2 - stage)   ; successor relation between stages
    (is-table ?s - surface)         ; marks the table surface object
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions (namespaced as "lp-"). Each action explicitly consumes the
  ;; current stage and produces its successor stage to enforce ordered
  ;; progression (no temporal backtracking).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Pick up a clear block from a surface (table)
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

  ;; Unstack a clear block ?b from on top of block ?below
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

  ;; Put down a held block onto the table surface
  (:action lp-putdown
    :parameters (?b - block ?s - surface ?t - stage ?t2 - stage)
    :precondition (and
      (holding ?b)
      (is-table ?s)
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

  ;; Stack a held block ?b onto block ?dest (destination must be clear)
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