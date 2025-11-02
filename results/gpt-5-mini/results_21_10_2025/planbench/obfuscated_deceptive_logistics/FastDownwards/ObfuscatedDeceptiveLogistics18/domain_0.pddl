(define (domain user_provided_domain_inferred)
  ; Domain created by orchestrator from user-provided structured models.
  ; Modeling assumptions (conservative):
  ; - Single implicit agent named 'player' treated as a normal object of type obj.
  ; - Predicate arities per provided assumptions (see predicates below).
  ; - Conditional effects from the source were encoded as separate action variants
  ;   (e.g., sip with/without a cat) because :conditional-effects is not used.
  ; - All objects are of type obj.
  ; - No temporal or numeric features used. Only STRIPS-style add/delete effects.
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ; hand(holder,object)
    (hand ?holder - obj ?o - obj)
    ; cats(object)
    (cats ?x - obj)
    ; texture(object,descriptor)
    (texture ?x - obj ?d - obj)
    ; vase(object)
    (vase ?x - obj)
    ; next(object1,object2)
    (next ?x - obj ?y - obj)
    ; sneeze(object)
    (sneeze ?x - obj)
    ; stupendous(object)
    (stupendous ?x - obj)
    ; collect(owner,object)
    (collect ?owner - obj ?x - obj)
    ; spring(subject,target) -- included but unused in actions; preserved from input
    (spring ?x - obj ?y - obj)
  )

  ; Action: paltry
  ; Parameters: object_A object_B object_C
  ; Preconditions: hand(player,object_A) & next(object_A,object_B) & texture(object_B,object_C)
  ; Effects: add collect(player,object_B), add stupendous(object_B), del next(object_A,object_B)
  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (next ?a ?b)
      (texture ?b ?c)
    )
    :effect (and
      (collect player ?b)
      (stupendous ?b)
      (not (next ?a ?b))
    )
  )

  ; Action: sip (no-cat variant)
  ; Preconditions: hand(player,object_A) & vase(object_A) & texture(object_A,object_B)
  ; Effects: add stupendous(object_A)
  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (vase ?a)
      (texture ?a ?b)
    )
    :effect (and
      (stupendous ?a)
    )
  )

  ; Action: sip-with-cat (conditional effect encoded as an action variant)
  ; Preconditions: same as sip plus cats(object_C)
  ; Effects: add stupendous(object_A) and sneeze(object_C)
  (:action sip-with-cat
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (vase ?a)
      (texture ?a ?b)
      (cats ?c)
    )
    :effect (and
      (stupendous ?a)
      (sneeze ?c)
    )
  )

  ; Action: clip
  ; Preconditions: hand(player,object_A) & next(object_B,object_C)
  ; Effects: add next(object_A,object_B) & add collect(object_A,object_C) & del next(object_B,object_C)
  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?b)
      (collect ?a ?c)
      (not (next ?b ?c))
    )
  )

  ; Action: wretched (base variant)
  ; Preconditions: hand(player,object_A) & vase(object_B) & cats(object_C)
  ; Effects: add sneeze(object_C) & add collect(player,object_B) & del vase(object_B)
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (hand player ?a)
      (vase ?b)
      (cats ?c)
    )
    :effect (and
      (sneeze ?c)
      (collect player ?b)
      (not (vase ?b))
    )
  )

  ; Action: wretched-with-texture (conditional effect encoded as variant)
  ; Preconditions: same as wretched plus texture(object_D,object_A)
  ; Effects: same as wretched plus stupendous(object_A)
  (:action wretched-with-texture
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (hand player ?a)
      (vase ?b)
      (cats ?c)
      (texture ?d ?a)
    )
    :effect (and
      (sneeze ?c)
      (collect player ?b)
      (not (vase ?b))
      (stupendous ?a)
    )
  )

  ; Action: memory
  ; Preconditions: collect(player,object_A) & next(object_A,object_B)
  ; Effects: add next(object_B,object_C) & add stupendous(object_C) & del next(object_A,object_B)
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (collect player ?a)
      (next ?a ?b)
    )
    :effect (and
      (next ?b ?c)
      (stupendous ?c)
      (not (next ?a ?b))
    )
  )

  ; Action: tightfisted (base variant)
  ; Preconditions: hand(player,object_A) & collect(object_B,object_C)
  ; Effects: add collect(player,object_C) & del collect(object_B,object_C)
  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (collect ?b ?c)
    )
    :effect (and
      (collect player ?c)
      (not (collect ?b ?c))
    )
  )

  ; Action: tightfisted-vase (variant when collected object is a vase)
  ; Preconditions: same as tightfisted plus vase(object_C)
  ; Effects: same as tightfisted plus sneeze(player)
  (:action tightfisted-vase
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand player ?a)
      (collect ?b ?c)
      (vase ?c)
    )
    :effect (and
      (collect player ?c)
      (not (collect ?b ?c))
      (sneeze player)
    )
  )

)