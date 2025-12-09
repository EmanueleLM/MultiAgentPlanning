(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)    ; disk ?d is directly on top of disk ?s
    (on-peg  ?d - disk ?p - peg)     ; disk ?d is directly on peg ?p
    (clear-disk ?d - disk)           ; nothing on top of disk ?d
    (clear-peg ?p - peg)             ; nothing on top of peg ?p
    (current ?s - stage)             ; current stage pointer
    (succ ?s1 - stage ?s2 - stage)   ; successor relation between stages
    (smaller ?d1 - disk ?d2 - disk)  ; disk ?d1 is strictly smaller than disk ?d2
  )

  ;; Move top disk that is directly on a peg to another peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains clear
      (clear-disk ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk that is on top of another disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-disk ?from)

      ;; moved disk remains clear
      (clear-disk ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk that is directly on a peg onto another disk (enforce size ordering)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-peg ?from)

      ;; moved disk remains clear
      (clear-disk ?d)

      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move top disk that is on top of another disk onto another disk (enforce size ordering)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-disk ?from)

      ;; moved disk remains clear
      (clear-disk ?d)

      (not (current ?s))
      (current ?s2)
    )
  )
)