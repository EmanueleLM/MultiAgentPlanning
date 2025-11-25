(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)            ; disk ?d is on peg ?p (somewhere in stack)
    (top ?p - peg ?d - disk)          ; disk ?d is the top disk on peg ?p
    (above ?d - disk ?b - disk)       ; disk ?d is directly above disk ?b (on same peg)
    (has-below ?d - disk)             ; disk ?d has a disk directly below it
    (empty ?p - peg)                  ; peg ?p is empty (no disks)
    (at-step ?s - step)
    (succ ?s - step ?s2 - step)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2
  )

  ;; Case 1: move a top disk that has a disk below it onto an empty peg
  (:action move_from_with_below_to_empty
    :parameters (?s ?s2 - step ?d ?b - disk ?ps ?pt - peg)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (top ?ps ?d)
      (on ?d ?ps)
      (has-below ?d)
      (above ?d ?b)
      (empty ?pt)
    )
    :effect (and
      (not (at-step ?s)) (at-step ?s2)

      (not (on ?d ?ps)) (on ?d ?pt)

      (not (top ?ps ?d)) (top ?ps ?b)
      (not (empty ?pt))
      (top ?pt ?d)

      (not (above ?d ?b))
      (not (has-below ?d))
    )
  )

  ;; Case 2: move a top disk that has a disk below it onto a non-empty peg whose top is ?t
  (:action move_from_with_below_to_nonempty
    :parameters (?s ?s2 - step ?d ?b - disk ?ps ?pt ?t - disk)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (top ?ps ?d)
      (on ?d ?ps)
      (has-below ?d)
      (above ?d ?b)
      (top ?pt ?t)
      (on ?t ?pt)
      (smaller ?d ?t)
    )
    :effect (and
      (not (at-step ?s)) (at-step ?s2)

      (not (on ?d ?ps)) (on ?d ?pt)

      (not (top ?ps ?d)) (top ?ps ?b)

      (not (top ?pt ?t)) (top ?pt ?d)

      (not (above ?d ?b)) (above ?d ?t)
      ;; has-below ?d remains true because it now has ?t below
    )
  )

  ;; Case 3: move a top disk that has no disk below (it is the only disk on its peg) onto an empty peg
  (:action move_bottom_to_empty
    :parameters (?s ?s2 - step ?d - disk ?ps ?pt - peg)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (top ?ps ?d)
      (on ?d ?ps)
      (not (has-below ?d))
      (empty ?pt)
    )
    :effect (and
      (not (at-step ?s)) (at-step ?s2)

      (not (on ?d ?ps)) (on ?d ?pt)

      (not (top ?ps ?d)) (empty ?ps)

      (not (empty ?pt))
      (top ?pt ?d)
      ;; has-below ?d remains false
    )
  )

  ;; Case 4: move a top disk that has no disk below onto a non-empty peg whose top is ?t
  (:action move_bottom_to_nonempty
    :parameters (?s ?s2 - step ?d - disk ?ps ?pt ?t - disk)
    :precondition (and
      (at-step ?s)
      (succ ?s ?s2)
      (top ?ps ?d)
      (on ?d ?ps)
      (not (has-below ?d))
      (top ?pt ?t)
      (on ?t ?pt)
      (smaller ?d ?t)
    )
    :effect (and
      (not (at-step ?s)) (at-step ?s2)

      (not (on ?d ?ps)) (on ?d ?pt)

      (not (top ?ps ?d)) (empty ?ps)

      (not (top ?pt ?t)) (top ?pt ?d)

      (above ?d ?t)
      (has-below ?d)
      (not (empty ?pt))
    )
  )
)