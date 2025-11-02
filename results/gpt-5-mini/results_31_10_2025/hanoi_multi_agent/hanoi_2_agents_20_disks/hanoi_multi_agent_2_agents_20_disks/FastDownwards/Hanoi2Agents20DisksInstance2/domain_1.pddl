(define (domain hanoi-2agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?s - (either disk peg))    ; disk ?d is directly on disk or peg ?s
    (clear ?d - disk)                        ; no disk on top of ?d (it is top on its peg)
    (empty ?p - peg)                         ; peg has no disk directly on it
    (can-move ?a - agent ?d - disk)          ; agent ?a is allowed to move disk ?d
    (larger ?d1 - disk ?d2 - disk)           ; d1 is larger than d2
  )

  ;; Move a disk that sits on another disk to an empty peg
  (:action move-disk-disk-to-peg
    :parameters (?agent - agent ?d - disk ?below - disk ?peg - peg)
    :precondition (and
                    (on ?d ?below)
                    (clear ?d)
                    (empty ?peg)
                    (can-move ?agent ?d)
                  )
    :effect (and
              (not (on ?d ?below))
              (on ?d ?peg)
              (not (empty ?peg))
              (clear ?d)
              (clear ?below)
            )
  )

  ;; Move a disk that sits on a peg to an empty peg
  (:action move-disk-peg-to-peg
    :parameters (?agent - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (empty ?to)
                    (can-move ?agent ?d)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (empty ?to))
              (empty ?from)
              (clear ?d)
            )
  )

  ;; Move a disk that sits on a disk to on top of another disk
  (:action move-disk-disk-to-disk
    :parameters (?agent - agent ?d - disk ?below - disk ?target - disk)
    :precondition (and
                    (on ?d ?below)
                    (clear ?d)
                    (clear ?target)
                    (larger ?target ?d)
                    (can-move ?agent ?d)
                  )
    :effect (and
              (not (on ?d ?below))
              (on ?d ?target)
              (clear ?d)
              (clear ?below)
              (not (clear ?target))
            )
  )

  ;; Move a disk that sits on a peg to on top of another disk
  (:action move-disk-peg-to-disk
    :parameters (?agent - agent ?d - disk ?from - peg ?target - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?target)
                    (larger ?target ?d)
                    (can-move ?agent ?d)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?target)
              (clear ?d)
              (not (clear ?target))
              (empty ?from)
            )
  )

)