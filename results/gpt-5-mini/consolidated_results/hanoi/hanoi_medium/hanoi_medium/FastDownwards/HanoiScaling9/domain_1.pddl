(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (top ?peg - peg ?d - disk)      ; ?d is the topmost disk on ?peg
    (empty ?peg - peg)              ; peg is empty (no disks)
    (curr ?s - stage)               ; current stage
    (next ?s - stage ?s2 - stage)   ; stage successor relation
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: d1 is smaller than d2
  )

  ;; Move cases are split so effects can be pure STRIPS (no conditional effects).
  ;; 1) source support is a disk (u), target peg is empty
  (:action move_from_disk_to_empty
    :parameters (?d - disk ?from - peg ?u - disk ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?u)
      (empty ?to)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      ;; update support relationships
      (not (on ?d ?u))
      (on ?d ?to)
      ;; update top pointers
      (not (top ?from ?d))
      (top ?from ?u)
      (not (empty ?to))
      (top ?to ?d)
      ;; advance stage
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 2) source support is a disk (u), target peg has top disk (topp)
  (:action move_from_disk_to_disk
    :parameters (?d - disk ?from - peg ?u - disk ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?u)
      (top ?to ?topp)
      (smaller ?d ?topp)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?topp)
      (not (top ?from ?d))
      (top ?from ?u)
      (not (top ?to ?topp))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 3) source support is the peg (d directly on peg), target peg is empty
  (:action move_from_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (empty ?to)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (empty ?from)
      (not (empty ?to))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; 4) source support is the peg (d directly on peg), target peg has top disk (topp)
  (:action move_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?topp - disk ?s - stage ?snext - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?from)
      (top ?to ?topp)
      (smaller ?d ?topp)
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?topp)
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?topp))
      (top ?to ?d)
      (not (curr ?s))
      (curr ?snext)
    )
  )
)