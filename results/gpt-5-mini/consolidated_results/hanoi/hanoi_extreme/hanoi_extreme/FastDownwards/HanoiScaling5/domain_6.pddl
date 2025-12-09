(define (domain hanoi-7-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (top ?p - peg ?d - disk)       ; ?d is the top disk on peg ?p
    (bottom ?p - peg ?d - disk)    ; ?d is the bottom disk on peg ?p (only true for bottom disk)
    (above ?d - disk ?b - disk)    ; ?d is directly on top of disk ?b
    (empty ?p - peg)               ; peg ?p has no disks

    (smaller ?d - disk ?b - disk)  ; static size ordering: ?d is smaller than ?b

    (step ?s - step)
    (next ?s1 - step ?s2 - step)
    (current ?s - step)

    (diff-peg ?p1 - peg ?p2 - peg)
  )

  ;; Move when source peg has a single disk (disk is both top and bottom) to an empty destination peg.
  (:action move_single_from_peg_to_empty
    :parameters (?d - disk ?p - peg ?q - peg ?s - step ?s2 - step)
    :precondition (and
      (top ?p ?d)
      (bottom ?p ?d)
      (empty ?q)
      (current ?s)
      (next ?s ?s2)
      (diff-peg ?p ?q)
    )
    :effect (and
      ;; source peg becomes empty
      (not (top ?p ?d))
      (not (bottom ?p ?d))
      (empty ?p)

      ;; destination peg now has the disk as both bottom and top
      (not (empty ?q))
      (top ?q ?d)
      (bottom ?q ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move when source peg has a stack and the top disk is on another disk, to an empty destination peg.
  (:action move_stack_top_from_peg_to_empty
    :parameters (?d - disk ?p - peg ?b - disk ?q - peg ?s - step ?s2 - step)
    :precondition (and
      (top ?p ?d)
      (above ?d ?b)
      (empty ?q)
      (current ?s)
      (next ?s ?s2)
      (diff-peg ?p ?q)
    )
    :effect (and
      ;; update source peg: top becomes the disk that was directly below
      (not (top ?p ?d))
      (top ?p ?b)

      ;; remove the adjacency linking moved disk to its previous below disk
      (not (above ?d ?b))

      ;; destination peg now has disk as both bottom and top (since it was empty)
      (not (empty ?q))
      (top ?q ?d)
      (bottom ?q ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move when source peg has a single disk (only disk on peg) onto the top disk of a non-empty destination peg.
  (:action move_single_from_peg_to_on_disk
    :parameters (?d - disk ?p - peg ?q - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (top ?p ?d)
      (bottom ?p ?d)
      (top ?q ?t)
      (smaller ?d ?t)
      (current ?s)
      (next ?s ?s2)
      (diff-peg ?p ?q)
    )
    :effect (and
      ;; source peg becomes empty
      (not (top ?p ?d))
      (not (bottom ?p ?d))
      (empty ?p)

      ;; destination peg: the previous top is no longer top; moved disk now sits on it
      (not (top ?q ?t))
      (above ?d ?t)
      (top ?q ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move when source peg has a stack and the top disk is on another disk, onto the top disk of a non-empty destination peg.
  (:action move_stack_top_from_peg_to_on_disk
    :parameters (?d - disk ?p - peg ?b - disk ?q - peg ?t - disk ?s - step ?s2 - step)
    :precondition (and
      (top ?p ?d)
      (above ?d ?b)
      (top ?q ?t)
      (smaller ?d ?t)
      (current ?s)
      (next ?s ?s2)
      (diff-peg ?p ?q)
    )
    :effect (and
      ;; source peg top is now the disk that was below
      (not (top ?p ?d))
      (top ?p ?b)

      ;; remove the old adjacency for moved disk
      (not (above ?d ?b))

      ;; destination peg: the previous top is no longer top; moved disk now sits on it
      (not (top ?q ?t))
      (above ?d ?t)
      (top ?q ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)