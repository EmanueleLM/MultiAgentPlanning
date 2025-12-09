(define (domain tower-of-hanoi-7)
  (:requirements :strips :typing)
  (:types disk peg place)
    ;; declare peg and disk as subtypes of place
    ;; PDDL syntax for subtypes: list subtypes followed by "-" and the parent type
    ;; In the problem file objects will be declared as disks and pegs; they are also places.
  (:predicates
    ;; base/location/support relations
    (support ?d - disk ?s - place)    ;; ?d is directly supported by ?s (s is a peg or a disk)
    (on-peg ?d - disk ?p - peg)       ;; ?d resides on peg ?p (i.e., its stack is on peg ?p)

    ;; structural fluents maintained explicitly
    (clear ?d - disk)                 ;; nothing is directly on ?d
    (empty ?p - peg)                  ;; peg ?p currently has no disk directly on it
    (top ?p - peg ?d - disk)          ;; ?d is the top disk of peg ?p (i.e., on-peg ?d ?p and clear ?d)

    ;; size relation (grounded in the problem file)
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a disk that is directly on another disk, placing it onto an empty destination peg.
  (:action move-disk-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?src - peg ?dst - peg)
    :precondition (and
      (support ?d ?below)
      (on-peg ?below ?src)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      ;; remove the old direct support and peg-membership of ?d
      (not (support ?d ?below))
      (not (on-peg ?d ?src))

      ;; destination peg is no longer empty; d becomes on that peg
      (not (empty ?dst))
      (on-peg ?d ?dst)
      (support ?d ?dst)

      ;; the disk that was below ?d becomes clear and becomes the new top of the source peg
      (clear ?below)
      (top ?src ?below)

      ;; d becomes the top of the destination peg
      (top ?dst ?d)

      ;; remove any stale top fact for ?src referencing ?d (if present)
      (not (top ?src ?d))
    )
  )

  ;; Move a disk that is directly on another disk, placing it onto a (non-empty) top disk ?t on destination peg.
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (support ?d ?below)
      (on-peg ?below ?src)
      (on-peg ?t ?dst)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; remove old support and peg-membership for ?d
      (not (support ?d ?below))
      (not (on-peg ?d ?src))

      ;; place d on top of t (support relation), and d belongs to dest peg
      (support ?d ?t)
      (on-peg ?d ?dst)

      ;; t is no longer clear (d now on t)
      (not (clear ?t))
      (not (top ?dst ?t))

      ;; the disk below becomes clear and becomes the new top on the source peg
      (clear ?below)
      (top ?src ?below)

      ;; d becomes the new top of the destination peg
      (top ?dst ?d)

      ;; remove any stale top fact for ?src referencing ?d (if present)
      (not (top ?src ?d))
    )
  )

  ;; Move a disk that is directly on a peg (no disk below it), placing it onto an empty destination peg.
  (:action move-disk-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dst - peg)
    :precondition (and
      (support ?d ?src)  ;; support is the peg itself in this case
      (on-peg ?d ?src)
      (clear ?d)
      (empty ?dst)
    )
    :effect (and
      ;; remove d from its former peg
      (not (support ?d ?src))
      (not (on-peg ?d ?src))
      (not (top ?src ?d))

      ;; peg src becomes empty (d was directly on the peg and clear, so peg has no disks left)
      (empty ?src)

      ;; place d on destination peg
      (not (empty ?dst))
      (support ?d ?dst)
      (on-peg ?d ?dst)
      (top ?dst ?d)
    )
  )

  ;; Move a disk that is directly on a peg (no disk below it), placing it onto an existing top disk ?t on destination peg.
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?t - disk ?src - peg ?dst - peg)
    :precondition (and
      (support ?d ?src)    ;; d's support is the peg ?src
      (on-peg ?d ?src)
      (clear ?d)
      (on-peg ?t ?dst)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; remove d from its former peg
      (not (support ?d ?src))
      (not (on-peg ?d ?src))
      (not (top ?src ?d))

      ;; place d on t and mark membership to dest peg
      (support ?d ?t)
      (on-peg ?d ?dst)

      ;; t is no longer clear and no longer top
      (not (clear ?t))
      (not (top ?dst ?t))

      ;; d becomes top of destination peg
      (top ?dst ?d)

      ;; because d was directly on peg src and was clear, src becomes empty
      (empty ?src)
    )
  )
)