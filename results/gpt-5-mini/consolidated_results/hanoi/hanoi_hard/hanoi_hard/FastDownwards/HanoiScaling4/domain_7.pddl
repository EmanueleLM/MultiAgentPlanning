(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom disk)
    (on-disk ?d - disk ?b - disk)     ; disk directly on another disk
    (top ?p - peg ?d - disk)          ; ?d is the top disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks
    (clear ?d - disk)                 ; no disk on top of ?d
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    (current ?s - stage)              ; current stage
    (next ?s - stage ?s2 - stage)     ; stage successor
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-top-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (clear ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (top ?to ?d)

      (empty ?from)
      (not (empty ?to))

      (clear ?d)
    )
  )

  ;; Move a top disk that is on another disk (i.e., not on the peg directly)
  ;; to an empty peg. The disk immediately below (?below) becomes the new top of ?from.
  (:action move-top-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (clear ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (top ?from ?d))
      (top ?from ?below)

      (top ?to ?d)
      (not (empty ?to))

      (clear ?below)
      (clear ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto another disk (target top disk ?t).
  (:action move-top-onpeg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      (not (top ?from ?d))
      (empty ?from)

      (not (top ?to ?t))
      (top ?to ?d)

      (not (clear ?t))
      (clear ?d)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is on another disk onto another disk.
  ;; The disk immediately below (?below) becomes new top of ?from.
  (:action move-top-ondisk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?t)
      (clear ?d)
      (smaller ?d ?t)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?t))
      (top ?to ?d)

      (not (clear ?t))
      (clear ?below)
      (clear ?d)
      (not (empty ?to))
    )
  )
)