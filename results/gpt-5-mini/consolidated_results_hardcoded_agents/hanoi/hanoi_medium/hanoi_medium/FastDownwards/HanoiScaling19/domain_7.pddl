(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg
    A_t B_t C_t D_t E_t - disk
  )

  (:predicates
    (on ?d - disk ?p - (either peg disk))
    (clear ?p - (either peg disk))
  )

  ;; Move a top disk onto an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Moves placing one disk onto another are constrained by the typing-based size ordering.
  ;; Each action below permits only pairs where the source disk is strictly smaller than the target disk.
  (:action move-onto-A-B_C_D_E
    :parameters (?d - A_t ?from - (either peg disk) ?to - (either B_t C_t D_t E_t))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-onto-B-C_D_E
    :parameters (?d - B_t ?from - (either peg disk) ?to - (either C_t D_t E_t))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-onto-C-D_E
    :parameters (?d - C_t ?from - (either peg disk) ?to - (either D_t E_t))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-onto-D-E
    :parameters (?d - D_t ?from - (either peg disk) ?to - E_t)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)