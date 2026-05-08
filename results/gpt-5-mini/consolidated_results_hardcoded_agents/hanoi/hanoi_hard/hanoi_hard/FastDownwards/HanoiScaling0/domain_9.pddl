(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (at ?d - disk ?p - peg)            ; disk is located at peg
    (on ?d - disk ?under - disk)      ; disk is directly on another disk
    (on-base ?d - disk ?p - peg)      ; disk is directly on the peg (bottom)
    (clear ?d - disk)                 ; no disk on top of this disk
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    (current ?s - step)               ; current time step/stage
    (succ ?s1 - step ?s2 - step)      ; successor relation over steps
  )

  ;; Move a top disk that sits on another disk to a destination disk (stack onto disk)
  (:action move-disk-disk-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?under - disk ?to - peg ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (at ?d ?from)
      (clear ?d)
      (on ?d ?under)
      (at ?under ?from)
      (at ?destTop ?to)
      (clear ?destTop)
      (smaller ?d ?destTop)
      (not (empty ?from))
    )
    :effect (and
      (not (current ?s)) (current ?s2)
      (not (at ?d ?from)) (at ?d ?to)
      (not (on ?d ?under)) (on ?d ?destTop)
      (not (clear ?destTop))
      (clear ?under)
      (clear ?d)
    )
  )

  ;; Move a top disk that sits on another disk to an empty peg (place on base)
  (:action move-disk-disk-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?under - disk ?to - peg)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (at ?d ?from)
      (clear ?d)
      (on ?d ?under)
      (at ?under ?from)
      (empty ?to)
      (not (empty ?from))
    )
    :effect (and
      (not (current ?s)) (current ?s2)
      (not (at ?d ?from)) (at ?d ?to)
      (not (on ?d ?under)) (on-base ?d ?to)
      (not (empty ?to))
      (clear ?under)
      (clear ?d)
    )
  )

  ;; Move a top disk that is on the base of its peg to a destination disk (stack onto disk)
  (:action move-disk-base-to-disk
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?destTop - disk)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (at ?d ?from)
      (clear ?d)
      (on-base ?d ?from)
      (at ?destTop ?to)
      (clear ?destTop)
      (smaller ?d ?destTop)
      (not (empty ?from))
    )
    :effect (and
      (not (current ?s)) (current ?s2)
      (not (at ?d ?from)) (at ?d ?to)
      (not (on-base ?d ?from)) (on ?d ?destTop)
      (not (clear ?destTop))
      (clear ?d)
      (empty ?from)
    )
  )

  ;; Move a top disk that is on the base of its peg to an empty peg (base to base)
  (:action move-disk-base-to-base
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current ?s) (succ ?s ?s2)
      (at ?d ?from)
      (clear ?d)
      (on-base ?d ?from)
      (empty ?to)
      (not (empty ?from))
    )
    :effect (and
      (not (current ?s)) (current ?s2)
      (not (at ?d ?from)) (at ?d ?to)
      (not (on-base ?d ?from)) (on-base ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )
)