(define (domain corrected_neutral_model)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (Hand ?h - object)
    (Cat ?c - object)
    (Texture ?t - object)
    (Holds ?h - object ?x - object)        ; hand h holds entity x (cat or sneezer)
    (Attached ?x - object ?t - object)    ; entity x is attached to texture t
    (Sneezer ?s - object)
    (Collected ?t - object ?collector - object)
    (SpringNode ?s - object)
    (Collector ?st - object)
    (free-attached ?x - object)            ; x currently has no Attached relation (source is free)
    (free-held ?x - object)                ; x currently not held by any Hand
  )

  ;; sip: create a Holds relation between a hand and a cat when both are attached to same texture.
  (:action sip
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (Hand ?h)
      (Cat ?c)
      (Texture ?t)
      (Attached ?h ?t)
      (Attached ?c ?t)
      (free-held ?c)
    )
    :effect (and
      (Holds ?h ?c)
      (not (free-held ?c))
    )
  )

  ;; paltry: establish attachment of a hand to a texture by using a held cat's attachment.
  ;; Requires the hand to be free-attached so we do not create multiple attachments for same source.
  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
    :precondition (and
      (Hand ?h)
      (Cat ?c)
      (Texture ?t)
      (Holds ?h ?c)
      (Attached ?c ?t)
      (free-attached ?h)
    )
    :effect (and
      (Attached ?h ?t)
      (not (free-attached ?h))
    )
  )

  ;; clip: create a Holds relation between a hand and a sneezer when both are attached to same texture.
  (:action clip
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (Hand ?h)
      (Sneezer ?s)
      (Texture ?t)
      (Attached ?s ?t)
      (Attached ?h ?t)
      (free-held ?s)
    )
    :effect (and
      (Holds ?h ?s)
      (not (free-held ?s))
    )
  )

  ;; wretched: move a sneezer's attachment from t1 to t2 when both textures are collected by same Collector.
  ;; This is an explicit move: it deletes the old attachment and adds the new.
  (:action wretched
    :parameters (?s - object ?t1 - object ?t2 - object ?collector - object)
    :precondition (and
      (Sneezer ?s)
      (Texture ?t1)
      (Texture ?t2)
      (Collector ?collector)
      (Attached ?s ?t1)
      (Collected ?t1 ?collector)
      (Collected ?t2 ?collector)
    )
    :effect (and
      (Attached ?s ?t2)
      (not (Attached ?s ?t1))
    )
  )

  ;; memory: move a cat's attachment between spring nodes (explicit move).
  (:action memory
    :parameters (?c - object ?s1 - object ?s2 - object)
    :precondition (and
      (Cat ?c)
      (SpringNode ?s1)
      (SpringNode ?s2)
      (Attached ?c ?s1)
    )
    :effect (and
      (Attached ?c ?s2)
      (not (Attached ?c ?s1))
    )
  )

  ;; tightfisted: create an attachment for a hand by using an existing Holds relation to a sneezer and the sneezer's attachment.
  (:action tightfisted
    :parameters (?h - object ?s - object ?t - object)
    :precondition (and
      (Hand ?h)
      (Sneezer ?s)
      (Texture ?t)
      (Attached ?s ?t)
      (Holds ?h ?s)
      (free-attached ?h)
    )
    :effect (and
      (Attached ?h ?t)
      (not (free-attached ?h))
    )
  )

  ;; Explicit release of a hold: frees the held entity.
  (:action release_hold
    :parameters (?h - object ?x - object)
    :precondition (and
      (Holds ?h ?x)
    )
    :effect (and
      (not (Holds ?h ?x))
      (free-held ?x)
    )
  )

  ;; Explicit detach: remove an Attached relation and mark the source free-attached.
  (:action detach
    :parameters (?x - object ?t - object)
    :precondition (and
      (Attached ?x ?t)
    )
    :effect (and
      (not (Attached ?x ?t))
      (free-attached ?x)
    )
  )

)