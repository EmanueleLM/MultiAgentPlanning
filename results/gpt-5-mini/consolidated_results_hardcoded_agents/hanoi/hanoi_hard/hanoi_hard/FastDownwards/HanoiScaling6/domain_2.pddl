(define (domain hanoi-multiagent-revised)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    disk peg
    diskA_type diskB_type diskC_type diskD_type diskE_type diskF_type - disk
  )

  (:predicates
    ;; disk directly on either a peg or another disk
    (on ?d - disk ?x - (either peg disk))

    ;; top-clear: there is nothing on top of ?x (peg or disk)
    (clear ?x - (either peg disk))
  )

  ;; Generic move onto an empty peg (any disk -> empty peg)
  ;; Origin: mover
  (:action mover_move_to_peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)     ;; destination peg must be empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clear/top facts
      (not (clear ?to))   ;; peg no longer empty at top
      (clear ?from)       ;; former support becomes top-clear
      (clear ?d)          ;; moved disk is now top-most
    )
  )

  ;; Typed actions enforcing size ordering without a large static 'smaller' relation.
  ;; Each action allows a specific (smaller) source-disk type to be placed onto only larger disk types.

  ;; diskA (smallest) can be placed onto any larger disk
  (:action mover_move_onto_diskA
    :parameters (?d - diskA_type ?from - (either peg disk) ?t - (either diskB_type diskC_type diskD_type diskE_type diskF_type))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (clear ?t))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; diskB can be placed onto any larger disk (C..F)
  (:action mover_move_onto_diskB
    :parameters (?d - diskB_type ?from - (either peg disk) ?t - (either diskC_type diskD_type diskE_type diskF_type))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (clear ?t))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; diskC -> onto D..F
  (:action mover_move_onto_diskC
    :parameters (?d - diskC_type ?from - (either peg disk) ?t - (either diskD_type diskE_type diskF_type))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (clear ?t))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; diskD -> onto E..F
  (:action mover_move_onto_diskD
    :parameters (?d - diskD_type ?from - (either peg disk) ?t - (either diskE_type diskF_type))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (clear ?t))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; diskE -> onto F only
  (:action mover_move_onto_diskE
    :parameters (?d - diskE_type ?from - (either peg disk) ?t - diskF_type)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)

      (not (clear ?t))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; diskF (largest) has no 'onto-disk' action because no disk is larger than it.
)