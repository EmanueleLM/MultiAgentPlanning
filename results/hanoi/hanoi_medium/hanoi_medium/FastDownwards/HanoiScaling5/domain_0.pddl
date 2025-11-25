(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg pos)

  (:predicates
    ;; disk placement: disk is directly at position pos on peg
    (at ?d - disk ?p - peg ?pos - pos)

    ;; current top index (pos) for each peg: the highest occupied position (pos0 means empty)
    (top ?p - peg ?pos - pos)

    ;; position order relations
    (succ ?p1 - pos ?p2 - pos)
    (pred ?p1 - pos ?p2 - pos)

    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk onto an empty peg (destination top is pos0).
  (:action move-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?i - pos ?j - pos ?predi - pos)
    :precondition (and
      (at ?d ?from ?i)
      (top ?from ?i)
      (top ?to pos0)
      (succ pos0 ?j)
      (pred ?predi ?i)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source
      (not (at ?d ?from ?i))
      (not (top ?from ?i))
      ;; place on destination at new top position ?j
      (at ?d ?to ?j)
      ;; update tops
      (top ?from ?predi)
      (not (top ?to pos0))
      (top ?to ?j)
    )
  )

  ;; Move a top disk onto a peg whose current top is some disk ?e (non-empty).
  (:action move-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?i - pos ?k - pos ?j - pos ?predi - pos ?e - disk)
    :precondition (and
      (at ?d ?from ?i)
      (top ?from ?i)
      (top ?to ?k)
      (at ?e ?to ?k)
      (succ ?k ?j)
      (pred ?predi ?i)
      (smaller ?d ?e)
      (not (= ?from ?to))
    )
    :effect (and
      ;; remove from source
      (not (at ?d ?from ?i))
      (not (top ?from ?i))
      ;; place on destination at new top position ?j
      (at ?d ?to ?j)
      ;; update tops
      (top ?from ?predi)
      (not (top ?to ?k))
      (top ?to ?j)
    )
  )
)