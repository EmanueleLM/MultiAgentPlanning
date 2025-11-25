(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)         ; disk directly on peg (no disk below)
    (on-disk ?d - disk ?below - disk ?p - peg) ; disk directly on another disk on peg
    (top ?d - disk ?p - peg)            ; disk is the top disk on peg
    (empty ?p - peg)                    ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)     ; d1 is smaller than d2
    (current ?s - stage)                ; current stage/time
    (succ ?s1 - stage ?s2 - stage)      ; successor relation between stages
  )

  ;; Move a disk that is directly on a peg to an empty peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
    )
    :effect (and
      ;; source: d removed from source peg and source becomes empty
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      (empty ?pfrom)

      ;; destination: d now directly on destination peg and top there
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on a peg onto another top disk
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?t))
    )
    :effect (and
      ;; source: remove moved disk from source and mark source empty
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      (empty ?pfrom)

      ;; destination: d is now directly on disk t and top there
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      ;; previous top on destination is no longer top
      (not (top ?t ?pto))
      ;; if t was directly on the peg, it no longer is (delete is safe if it wasn't)
      (not (on-peg ?t ?pto))

      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?pfrom - peg ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below ?pfrom)
      (top ?d ?pfrom)
      (empty ?pto)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?below))
    )
    :effect (and
      ;; remove the moved disk's direct-on-disk relation and its top status on source
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      ;; the disk that was below becomes the new top on the source peg
      (top ?below ?pfrom)

      ;; destination: disk is now directly on destination peg and top there
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk onto another top disk
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?below - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
      (not (= ?pfrom ?pto))
      (not (= ?d ?below))
      (not (= ?d ?t))
    )
    :effect (and
      ;; source: remove moved disk's relation and its top status
      (not (on-disk ?d ?below ?pfrom))
      (not (top ?d ?pfrom))
      ;; disk below becomes the new top on the source peg
      (top ?below ?pfrom)

      ;; destination: disk is now directly on the target disk and top there
      (on-disk ?d ?t ?pto)
      (top ?d ?pto)
      ;; the previous top on destination is no longer top
      (not (top ?t ?pto))
      ;; if t was directly on the peg, it no longer is
      (not (on-peg ?t ?pto))

      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)