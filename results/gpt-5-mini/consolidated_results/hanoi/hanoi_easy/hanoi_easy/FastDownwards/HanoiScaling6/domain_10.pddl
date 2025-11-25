(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    (is-operator ?op - operator)
    (on ?d - disk ?s - support)      ; ?d is directly on support ?s (disk or peg)
    (clear ?s - support)             ; support has no disk directly on it (disk is top, peg empty)
    (smaller ?d1 - disk ?d2 - disk)  ; size ordering: ?d1 is smaller than ?d2
    (next ?t1 - stage ?t2 - stage)   ; successor relation between contiguous stages
    (current ?t - stage)             ; which stage is currently active
  )

  ;; Move a top disk from any support (disk or peg) onto an empty peg,
  ;; advancing the discrete global stage to its immediate successor.
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)      ; ?d is directly on ?from
      (clear ?d)         ; ?d is top of its support
      (clear ?to)        ; destination peg is empty (peg top clear)
      (current ?t)
      (next ?t ?t2)      ; enforce contiguous stage progression
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))  ; destination peg now has a disk on it (not empty)
      (clear ?from)      ; the support that lost the top disk becomes clear
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support (disk or peg) onto a top disk that is larger,
  ;; advancing the discrete global stage to its immediate successor.
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)       ; ?d is directly on ?from
      (clear ?d)          ; ?d is top of its support
      (clear ?to)         ; destination disk has no disk on top (is top)
      (smaller ?d ?to)    ; moved disk must be smaller than destination disk
      (current ?t)
      (next ?t ?t2)       ; enforce contiguous stage progression
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))   ; destination disk now has a disk on top
      (clear ?from)       ; the support that lost the top disk becomes clear
      (not (current ?t))
      (current ?t2)
    )
  )
)