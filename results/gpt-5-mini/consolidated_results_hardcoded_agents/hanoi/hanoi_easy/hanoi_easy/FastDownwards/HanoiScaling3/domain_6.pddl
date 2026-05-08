(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)    ;; ?d is immediately on support ?s (support = disk or peg)
    (clear ?s - support)          ;; nothing is immediately on ?s (s is a top disk or an empty peg)
    (smaller ?d1 - disk ?d2 - disk) ;; size ordering
    (current ?t - stage)          ;; current stage/timepoint
    (next ?t1 - stage ?t2 - stage) ;; immediate successor relation between stages
  )

  ;; Move a top disk from any support to an empty peg.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?topeg - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)           ;; disk is top
      (clear ?topeg)       ;; peg target is empty
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; remove old immediate support link
      (not (on ?d ?from))
      ;; new immediate support link
      (on ?d ?topeg)

      ;; the original support becomes top (clear)
      (clear ?from)

      ;; target peg is no longer empty
      (not (clear ?topeg))

      ;; moved disk is top
      (clear ?d)

      ;; advance stage strictly
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto a top disk (must be larger).
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?tod - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)          ;; moved disk is top
      (clear ?tod)        ;; destination disk is top
      (smaller ?d ?tod)   ;; cannot place larger on smaller
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; remove old immediate support link
      (not (on ?d ?from))
      ;; new immediate support link
      (on ?d ?tod)

      ;; the original support becomes top (clear)
      (clear ?from)

      ;; destination disk is no longer top
      (not (clear ?tod))

      ;; moved disk is top
      (clear ?d)

      ;; advance stage strictly
      (not (current ?t))
      (current ?t2)
    )
  )
)