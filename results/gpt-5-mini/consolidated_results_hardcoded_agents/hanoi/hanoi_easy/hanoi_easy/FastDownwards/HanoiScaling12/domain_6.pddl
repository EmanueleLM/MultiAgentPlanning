(define (domain hanoi4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk support relations
    (on-peg ?d - disk ?p - peg)        ; ?d directly supported by peg ?p (no disk between)
    (on-disk ?d - disk ?below - disk) ; ?d directly on top of ?below

    ;; top and emptiness
    (top ?d - disk ?p - peg)          ; ?d is the topmost disk on peg ?p
    (empty ?p - peg)                  ; peg has no disks

    ;; size ordering (strict)
    (smaller ?x - disk ?y - disk)

    ;; stage control: enforce strictly sequential moves
    (current ?s - stage)              ; which stage is current
    (succ ?s - stage ?s2 - stage)     ; successor relation over stages

    ;; distinctness facts to forbid no-op moves (explicit facts in problem)
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Move a top disk that is directly on its peg to an empty peg.
  ;; Advances stage by one; ensures contiguous occupancy semantics via explicit supports.
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove disk from source peg; source becomes empty
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; place disk directly on destination peg and mark top
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is directly on its peg onto the top disk of another peg.
  ;; Destination top disk must be larger.
  (:action move-onpeg-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?dst ?to)
      (smaller ?d ?dst)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; source becomes empty after removing its single disk
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; destination: moved disk now directly on dst and becomes the top; old top not top
      (on-disk ?d ?dst)
      (top ?d ?to)
      (not (top ?dst ?to))
    )
  )

  ;; Move a top disk that is on another disk to an empty peg.
  ;; Reveals the disk that was directly below as the new top of the source peg.
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove moved disk's support relation and its top status on source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; reveal the disk that was directly below as the new top of the source peg
      (top ?below ?from)

      ;; destination: moved disk becomes directly on the destination peg and top there
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a top disk that is on another disk onto the top disk of another peg.
  ;; Reveals the disk that was directly below as the new top of the source peg.
  (:action move-ondisk-to-ondisk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?dst - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?dst ?to)
      (smaller ?d ?dst)
      (diff ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current ?s))
      (current ?s2)

      ;; remove moved disk from its support and update source top
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      ;; destination: moved disk now on dst and becomes its top; old top is no longer top
      (on-disk ?d ?dst)
      (top ?d ?to)
      (not (top ?dst ?to))
    )
  )
)