(define (domain hanoi-7)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ; on ?d ?p : disk ?d is directly on place ?p (place is a disk or a peg)
    (on ?d ?p)
    ; clear ?p : place ?p has no disk directly on it (top is free)
    (clear ?p)
    ; larger ?big ?small : disk ?big is strictly larger than disk ?small
    (larger ?big ?small)
    ; succ ?s ?t : step ?t is the immediate successor of step ?s
    (succ ?s ?t)
    ; current ?s : planning is currently at stage/step ?s
    (current ?s)
  )

  ; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d ?from ?peg ?s ?t)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
      (current ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (not (current ?s))
      (current ?t)
    )
  )

  ; Move a top disk onto a (larger) disk
  (:action move-to-disk
    :parameters (?d ?from ?target ?s ?t)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (larger ?target ?d)
      (current ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)
      (not (clear ?target))
      (not (current ?s))
      (current ?t)
    )
  )
)