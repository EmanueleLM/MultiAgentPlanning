(define (domain orchestrated-domain)
  ; Requirements limited to FastDownwards-compatible features per instructions.
  ; Using :strips, :typing, and :negative-preconditions only.
  (:requirements :strips :typing :negative-preconditions)

  ; Types
  (:types agent object container)

  ; Predicates
  ; - (has ?a ?o)      : agent ?a currently possesses object ?o
  ; - (contains ?c ?o) : container ?c contains object ?o (e.g., water)
  ; - (is-clipped ?n)  : note/object ?n has been clipped (paperclip attached)
  ; - (remembered ?a ?n): agent ?a has recorded/remembered object ?n
  ; - (is-wretched ?a) : agent ?a is in a wretched state
  ; - (is-tightfisted ?a): agent ?a refuses to give money (hard constraint from preferences)
  ; - (thirsty ?a)     : agent ?a is thirsty
  ; - (sipped ?a)      : agent ?a has sipped (drunk) beverage
  ; - (paltry-given ?giver ?receiver ?o): a paltry transfer of ?o occurred from ?giver to ?receiver
  (:predicates
    (has ?a - agent ?o - object)
    (contains ?c - container ?o - object)
    (is-clipped ?n - object)
    (remembered ?a - agent ?n - object)
    (is-wretched ?a - agent)
    (is-tightfisted ?a - agent)
    (thirsty ?a - agent)
    (sipped ?a - agent)
    (paltry-given ?giver - agent ?receiver - agent ?o - object)
  )

  ; ---------------------------------------------------------------------
  ; ACTIONS
  ; ---------------------------------------------------------------------
  ; Notes on modelling choices and conflict resolutions:
  ; - The public information referenced actions named: paltry, sip, clip, wretched, memory, tightfisted.
  ;   Their natural-language descriptions were not provided as formal PDDL; the following formalizations
  ;   are consistent, distinct, and preserve the intended semantics inferred from names:
  ;     * paltry: transfer a small (paltry) object (e.g., coin) from one agent to another. Blocked if giver is tightfisted.
  ;     * sip: agent drinks the water from a container they hold; removes thirst and container content.
  ;     * clip: attach a paperclip to a note when the agent has both items; sets is-clipped on the note.
  ;     * memory: observer records / remembers a clipped note; requires the note to be clipped and the observer present
  ;               (we model presence implicitly by possession/holding; for simplicity we require nothing additional here).
  ;     * wretched: toggles a tightfisted agent into a wretched state and removes their tightfisted constraint,
  ;                 representing that a hard preference was overcome (this action was introduced to allow paltry to occur).
  ;     * tightfisted: mark an agent as tightfisted (captures the 'would rather not give' preference as a hard constraint).
  ;
  ; - Temporal and soft preferences in the original natural language are encoded as hard predicates and preconditions:
  ;   e.g., an agent initially marked (is-tightfisted X) cannot perform paltry until an action (wretched) removes that.
  ; - All actions use only STRIPS-style add/delete effects and (optional) negative preconditions to stay compatible
  ;   with the requested :requirements.
  ; - No :costs or temporal constructs are used; preferences have been encoded as constraints instead.

  ; Action: paltry
  ; Transfer a small object (coin) from giver to receiver if giver is not tightfisted.
  (:action paltry
    :parameters (?giver - agent ?receiver - agent ?obj - object)
    :precondition (and
                    (has ?giver ?obj)
                    (not (is-tightfisted ?giver))
                  )
    :effect (and
             (not (has ?giver ?obj))
             (has ?receiver ?obj)
             (paltry-given ?giver ?receiver ?obj)
            )
  )

  ; Action: sip
  ; Agent drinks the content (e.g., water) from a container they hold.
  (:action sip
    :parameters (?a - agent ?c - container ?content - object)
    :precondition (and
                    (has ?a ?c)
                    (contains ?c ?content)
                    (thirsty ?a)
                  )
    :effect (and
             (not (contains ?c ?content))
             (not (thirsty ?a))
             (sipped ?a)
            )
  )

  ; Action: clip
  ; Attach a paperclip to a note when agent has both items and the note is not already clipped.
  (:action clip
    :parameters (?a - agent ?paperclip - object ?note - object)
    :precondition (and
                    (has ?a ?paperclip)
                    (has ?a ?note)
                    (not (is-clipped ?note))
                  )
    :effect (and
             (is-clipped ?note)
            )
  )

  ; Action: memory
  ; Observer records (remembers) a clipped note. Requires the note to be clipped.
  (:action memory
    :parameters (?observer - agent ?note - object)
    :precondition (and
                    (is-clipped ?note)
                  )
    :effect (and
             (remembered ?observer ?note)
            )
  )

  ; Action: wretched
  ; If an agent is tightfisted, they can become wretched and cease being tightfisted (allows paltry later).
  (:action wretched
    :parameters (?a - agent)
    :precondition (and
                    (is-tightfisted ?a)
                  )
    :effect (and
             (is-wretched ?a)
             (not (is-tightfisted ?a))
            )
  )

  ; Action: tightfisted
  ; Mark an agent as tightfisted (captures a hard preference to avoid giving).
  (:action tightfisted
    :parameters (?a - agent)
    :precondition (and
                    (not (is-tightfisted ?a))
                  )
    :effect (and
             (is-tightfisted ?a)
            )
  )

)