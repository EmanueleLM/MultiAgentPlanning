(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; immediate support: disk is directly on a place (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; top-of-peg: the topmost disk currently sitting on a peg
    (top ?pg - peg ?d - disk)
    ;; explicit peg emptiness (kept consistent by actions)
    (peg-empty ?pg - peg)
    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage progression
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move the top disk from a peg whose top disk has a disk immediately under it,
  ;; onto an empty peg. After move, the origin peg's top becomes that immediate-under disk.
  (:action move_from_peg_under_disk_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)         ; d is topmost on origin peg
      (on ?d ?under)         ; the disk immediately under d
      (peg-empty ?to)        ; destination peg empty
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support
      (not (on ?d ?under))
      ;; origin peg top becomes the disk that was immediately under d
      (not (top ?from ?d))
      (top ?from ?under)

      ;; place d onto target peg (immediate support becomes target peg)
      (on ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move the top disk from a peg whose top disk sits directly on the peg (no disk under it),
  ;; onto an empty peg. After move, the origin peg becomes empty.
  (:action move_from_peg_under_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)         ; d is topmost on origin peg
      (on ?d ?under)         ; the immediate support is a peg (i.e., d was directly on the peg)
      (peg-empty ?to)        ; destination peg empty
    )
    :effect (and
      ;; stage progression
      (not (current ?s))
      (current ?s2)

      ;; remove d from its immediate support (the peg)
      (not (on ?d ?under))
      (not (top ?from ?d))
      ;; origin peg becomes empty
      (peg-empty ?from)

      ;; place d onto target peg
      (on ?d ?to)
      (top ?to ?d)
      (not (peg-empty ?to))
    )
  )

  ;; Move the top disk from a peg whose top disk has a disk immediately under it,
  ;; onto a non-empty peg whose top disk is ?t (must be larger).
  ;; After move, origin peg top becomes the immediate-under disk; destination top becomes d.
  (:action move_from_peg_under_disk_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - disk ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?under)
      (top ?to ?t)           ; destination current top disk
      (smaller ?d ?t)        ; cannot place larger on smaller
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

  ;; Move the top disk from a peg whose top disk sits directly on the peg (no disk under it),
  ;; onto a non-empty peg whose top disk is ?t (must be larger).
  ;; After move, origin peg becomes empty; destination top becomes d.
  (:action move_from_peg_under_peg_to_nonempty
    :parameters (?d - disk ?from - peg ?to - peg ?under - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?from ?d)
      (on ?d ?under)         ; under is a peg (d was directly on origin peg)
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