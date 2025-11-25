(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (no disk below)
    (on-disk ?d - disk ?below - disk)  ; disk directly on another disk
    (top ?d - disk ?p - peg)           ; disk d is the top disk on peg p
    (empty ?p - peg)                   ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)    ; d1 is smaller than d2
    (current ?s - stage)               ; the current stage/time step
    (succ ?s1 - stage ?s2 - stage)     ; s2 is the immediate successor of s1
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
    )
    :effect (and
      ;; remove from source
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      ;; source becomes empty
      (empty ?pfrom)

      ;; place on target peg as top and on-peg
      (on-peg ?d ?pto)
      (top ?d ?pto)
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
      (on-disk ?d ?below)
      (top ?d ?pfrom)
      (empty ?pto)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove the moved disk relation to its below disk and its top status
      (not (on-disk ?d ?below))
      (not (top ?d ?pfrom))

      ;; the disk below becomes top on the same peg
      (top ?below ?pfrom)

      ;; place moved disk on target peg
      (on-peg ?d ?pto)
      (top ?d ?pto)
      (not (empty ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on a peg onto a disk on another peg (target peg non-empty)
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-peg ?d ?pfrom)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove from source
      (not (on-peg ?d ?pfrom))
      (not (top ?d ?pfrom))
      ;; source becomes empty
      (empty ?pfrom)

      ;; place on target disk
      (on-disk ?d ?t)
      (top ?d ?pto)
      ;; the previous top on target is no longer top
      (not (top ?t ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )

  ;; Move a disk that is directly on another disk onto another disk
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?below - disk ?pfrom - peg ?t - disk ?pto - peg ?s - stage ?ns - stage)
    :precondition (and
      (current ?s)
      (on-disk ?d ?below)
      (top ?d ?pfrom)
      (top ?t ?pto)
      (smaller ?d ?t)
      (succ ?s ?ns)
    )
    :effect (and
      ;; remove moved-disk's relation to below and its top at source
      (not (on-disk ?d ?below))
      (not (top ?d ?pfrom))

      ;; below disk becomes top at source
      (top ?below ?pfrom)

      ;; place moved disk on target disk
      (on-disk ?d ?t)
      (top ?d ?pto)
      ;; previous top on target is no longer top
      (not (top ?t ?pto))

      ;; advance stage
      (not (current ?s))
      (current ?ns)
    )
  )
)