(define (domain hanoi-7)
  (:requirements :strips :typing)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)          ; disk ?d is directly on place ?p (peg or disk)
    (top ?p - place ?d - disk)        ; disk ?d is the topmost disk on place ?p (used for pegs)
    (empty ?p - place)                ; peg ?p is empty (no disks)
    (clear ?d - disk)                 ; no disk on top of ?d (i.e., it is clear)
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is strictly smaller than d2
  )

  ;; declare the three pegs as constants (names used by the concrete move actions)
  (:constants A B C - peg)

  ;; Move actions: for each ordered peg pair we provide two variants depending on whether
  ;; the moved disk sits directly on the source peg or on another disk, and for each of
  ;; those we provide two variants for destination being empty vs having a top disk.
  ;; These action schemas strictly enforce: only the top disk of the source may move,
  ;; the target must be empty or have a strictly larger top disk, and only the local
  ;; top/clear/top-of-peg predicates are updated for the affected pegs/disks.

  ;; -- Moves A -> B
  (:action move-A-B-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d A) (top A ?d) (empty B))
    :effect (and
      (not (on ?d A))
      (not (top A ?d))
      (not (empty B))
      (on ?d B)
      (top B ?d)
      (clear ?d)
      (empty A)
    )
  )

  (:action move-A-B-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d A) (top A ?d) (top B ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d A))
      (not (top A ?d))
      (not (top B ?t))
      (on ?d ?t)
      (top B ?d)
      (clear ?d)
      (not (clear ?t))
      (empty A)
    )
  )

  (:action move-A-B-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top A ?d) (empty B))
    :effect (and
      (not (on ?d ?u))
      (not (top A ?d))
      (not (empty B))
      (on ?d B)
      (top B ?d)
      (clear ?d)
      (top A ?u)
      (clear ?u)
    )
  )

  (:action move-A-B-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top A ?d) (top B ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top A ?d))
      (not (top B ?t))
      (on ?d ?t)
      (top B ?d)
      (top A ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

  ;; -- Moves A -> C
  (:action move-A-C-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d A) (top A ?d) (empty C))
    :effect (and
      (not (on ?d A))
      (not (top A ?d))
      (not (empty C))
      (on ?d C)
      (top C ?d)
      (clear ?d)
      (empty A)
    )
  )

  (:action move-A-C-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d A) (top A ?d) (top C ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d A))
      (not (top A ?d))
      (not (top C ?t))
      (on ?d ?t)
      (top C ?d)
      (clear ?d)
      (not (clear ?t))
      (empty A)
    )
  )

  (:action move-A-C-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top A ?d) (empty C))
    :effect (and
      (not (on ?d ?u))
      (not (top A ?d))
      (not (empty C))
      (on ?d C)
      (top C ?d)
      (clear ?d)
      (top A ?u)
      (clear ?u)
    )
  )

  (:action move-A-C-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top A ?d) (top C ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top A ?d))
      (not (top C ?t))
      (on ?d ?t)
      (top C ?d)
      (top A ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

  ;; -- Moves B -> A
  (:action move-B-A-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d B) (top B ?d) (empty A))
    :effect (and
      (not (on ?d B))
      (not (top B ?d))
      (not (empty A))
      (on ?d A)
      (top A ?d)
      (clear ?d)
      (empty B)
    )
  )

  (:action move-B-A-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d B) (top B ?d) (top A ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d B))
      (not (top B ?d))
      (not (top A ?t))
      (on ?d ?t)
      (top A ?d)
      (clear ?d)
      (not (clear ?t))
      (empty B)
    )
  )

  (:action move-B-A-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top B ?d) (empty A))
    :effect (and
      (not (on ?d ?u))
      (not (top B ?d))
      (not (empty A))
      (on ?d A)
      (top A ?d)
      (clear ?d)
      (top B ?u)
      (clear ?u)
    )
  )

  (:action move-B-A-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top B ?d) (top A ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top B ?d))
      (not (top A ?t))
      (on ?d ?t)
      (top A ?d)
      (top B ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

  ;; -- Moves B -> C
  (:action move-B-C-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d B) (top B ?d) (empty C))
    :effect (and
      (not (on ?d B))
      (not (top B ?d))
      (not (empty C))
      (on ?d C)
      (top C ?d)
      (clear ?d)
      (empty B)
    )
  )

  (:action move-B-C-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d B) (top B ?d) (top C ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d B))
      (not (top B ?d))
      (not (top C ?t))
      (on ?d ?t)
      (top C ?d)
      (clear ?d)
      (not (clear ?t))
      (empty B)
    )
  )

  (:action move-B-C-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top B ?d) (empty C))
    :effect (and
      (not (on ?d ?u))
      (not (top B ?d))
      (not (empty C))
      (on ?d C)
      (top C ?d)
      (clear ?d)
      (top B ?u)
      (clear ?u)
    )
  )

  (:action move-B-C-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top B ?d) (top C ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top B ?d))
      (not (top C ?t))
      (on ?d ?t)
      (top C ?d)
      (top B ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

  ;; -- Moves C -> A
  (:action move-C-A-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d C) (top C ?d) (empty A))
    :effect (and
      (not (on ?d C))
      (not (top C ?d))
      (not (empty A))
      (on ?d A)
      (top A ?d)
      (clear ?d)
      (empty C)
    )
  )

  (:action move-C-A-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d C) (top C ?d) (top A ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d C))
      (not (top C ?d))
      (not (top A ?t))
      (on ?d ?t)
      (top A ?d)
      (clear ?d)
      (not (clear ?t))
      (empty C)
    )
  )

  (:action move-C-A-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top C ?d) (empty A))
    :effect (and
      (not (on ?d ?u))
      (not (top C ?d))
      (not (empty A))
      (on ?d A)
      (top A ?d)
      (clear ?d)
      (top C ?u)
      (clear ?u)
    )
  )

  (:action move-C-A-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top C ?d) (top A ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top C ?d))
      (not (top A ?t))
      (on ?d ?t)
      (top A ?d)
      (top C ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

  ;; -- Moves C -> B
  (:action move-C-B-from-peg-to-empty
    :parameters (?d - disk)
    :precondition (and (on ?d C) (top C ?d) (empty B))
    :effect (and
      (not (on ?d C))
      (not (top C ?d))
      (not (empty B))
      (on ?d B)
      (top B ?d)
      (clear ?d)
      (empty C)
    )
  )

  (:action move-C-B-from-peg-to-disk
    :parameters (?d - disk ?t - disk)
    :precondition (and (on ?d C) (top C ?d) (top B ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d C))
      (not (top C ?d))
      (not (top B ?t))
      (on ?d ?t)
      (top B ?d)
      (clear ?d)
      (not (clear ?t))
      (empty C)
    )
  )

  (:action move-C-B-from-disk-to-empty
    :parameters (?d - disk ?u - disk)
    :precondition (and (on ?d ?u) (top C ?d) (empty B))
    :effect (and
      (not (on ?d ?u))
      (not (top C ?d))
      (not (empty B))
      (on ?d B)
      (top B ?d)
      (clear ?d)
      (top C ?u)
      (clear ?u)
    )
  )

  (:action move-C-B-from-disk-to-disk
    :parameters (?d - disk ?u - disk ?t - disk)
    :precondition (and (on ?d ?u) (top C ?d) (top B ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (not (top C ?d))
      (not (top B ?t))
      (on ?d ?t)
      (top B ?d)
      (top C ?u)
      (clear ?u)
      (clear ?d)
      (not (clear ?t))
    )
  )

)