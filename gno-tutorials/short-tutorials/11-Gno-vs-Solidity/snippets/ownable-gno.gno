package ownable

import (
    "std"
    "errors"
)

var owner std.Address

func init() {
    owner = std.PrevRealm().Addr()
}

func AssertIsOwner() {
    if std.PrevRealm().Addr() != owner {
        panic("not owner")
    }
}

func RestrictedAction() error {
    AssertIsOwner()
    // Only owner can call
    return nil
}
