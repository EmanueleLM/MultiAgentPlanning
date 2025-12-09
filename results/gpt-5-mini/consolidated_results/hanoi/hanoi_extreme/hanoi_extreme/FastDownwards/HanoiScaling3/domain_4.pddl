(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?u - disk)
    ;; topness predicates
    (clear-disk ?d - disk)   ; nothing on top of this disk
    (clear-peg ?p - peg)     ; peg has nothing on top
    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage progression
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a disk that is alone on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)       ; from peg becomes empty
      (not (clear-peg ?to))   ; to peg no longer empty
    )
  )

  ;; Move a disk that is alone on a peg onto another disk (which must be top and larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)       ; from peg becomes empty
      (not (clear-disk ?to))  ; destination disk now has something on top
    )
  )

  ;; Move a disk that is on top of another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)      ; the disk that was under becomes top
      (not (clear-peg ?to))   ; destination peg no longer empty
    )
  )

  ;; Move a disk that is on top of another disk onto another disk (must be top and larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)      ; the disk that was under becomes top
      (not (clear-disk ?to))  ; destination disk no longer top
    )
  )
)