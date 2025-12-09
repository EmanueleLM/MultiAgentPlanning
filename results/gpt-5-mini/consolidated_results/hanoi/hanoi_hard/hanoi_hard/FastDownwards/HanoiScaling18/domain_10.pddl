(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    ;; disk ?d is directly on place ?p (a disk or a peg)
    (on ?d - disk ?p - place)

    ;; nothing on top of this place (disk or peg)
    (clear ?p - place)

    ;; strict size ordering: ?big is larger than ?small
    (larger ?big - disk ?small - disk)

    ;; discrete stage control: which stage is current and immediate successor relation
    (stage-current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from its direct support ?from onto an empty peg ?to.
  ;; Preconditions:
  ;;   - ?d is immediately on ?from
  ;;   - ?d has no disk on top (clear)
  ;;   - ?to peg is empty (clear)
  ;;   - current stage is ?s and next stage is ?s2
  ;; Effects:
  ;;   - ?d is no longer on ?from and is now on ?to
  ;;   - ?to is no longer clear (has ?d on top)
  ;;   - ?from becomes clear (whatever was under ?d is now top)
  ;;   - ?d remains clear (nothing on top of moved disk)
  ;;   - advance stage from ?s to ?s2
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )

  ;; Move a top disk from its direct support ?from onto another disk ?to that is strictly larger.
  ;; Preconditions:
  ;;   - ?d is immediately on ?from
  ;;   - ?d has no disk on top (clear)
  ;;   - ?to has no disk on top (clear)
  ;;   - ?to is strictly larger than ?d
  ;;   - current stage is ?s and next stage is ?s2
  ;; Effects:
  ;;   - ?d is no longer on ?from and is now on ?to
  ;;   - ?to is no longer clear (has ?d on top)
  ;;   - ?from becomes clear
  ;;   - ?d remains clear
  ;;   - advance stage from ?s to ?s2
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)