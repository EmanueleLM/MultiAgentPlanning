(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; immediate support: disk is directly on an object (either a peg or another disk)
    (on ?d - disk ?p - object)
    ;; top-of-peg: the topmost disk currently sitting on a peg
    (top ?pg - peg ?d - disk)
    ;; explicit peg emptiness (kept consistent by actions)
    (peg-empty ?pg - peg)
    ;; static size ordering (smaller ?d1 ?d2 means d1 is strictly smaller than d2)
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage progression
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move top disk from a peg when the disk beneath it is another disk, onto an empty peg.
  (:action move_from_peg_under_disk_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)         ; d is topmost on origin peg
      (on ?d ?under)         ; immediate support is a disk
      (peg-empty ?to)        ; destination peg empty
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support
      (not (on ?d ?under))
      ;; update origin peg top to the disk that was immediately under d
      (not (top ?from ?d))
      (top ?from ?under)

      ;; place d onto target peg
      (on ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move top disk from a peg when the disk is directly on the peg, onto an empty peg.
  (:action move_from_peg_under_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)         ; d is topmost on origin peg
      (on ?d ?under)         ; immediate support is the origin peg
      (peg-empty ?to)        ; destination peg empty
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support (the peg) and mark origin empty
      (not (on ?d ?under))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; place d onto target peg
      (on ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move top disk from a peg when the disk beneath it is another disk, onto a non-empty peg.
  (:action move_from_peg_under_disk_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?under)         ; immediate support is a disk
      (top ?to ?t)           ; destination current top disk
      (smaller ?d ?t)        ; size constraint: d smaller than target top t
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support and update origin top
      (not (on ?d ?under))
      (not (top ?from ?d))
      (top ?from ?under)

      ;; put d on top of t at destination
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)
    )
  )

  ;; Move top disk from a peg when the disk is directly on the peg, onto a non-empty peg.
  (:action move_from_peg_under_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?under)         ; immediate support is the origin peg
      (top ?to ?t)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support (peg) and mark origin empty
      (not (on ?d ?under))
      (not (top ?from ?d))
      (peg-empty ?from)

      ;; put d on top of t at destination
      (not (top ?to ?t))
      (top ?to ?d)
      (on ?d ?t)
    )
  )
)