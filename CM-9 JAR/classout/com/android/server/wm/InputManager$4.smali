.class Lcom/android/server/wm/InputManager$4;
.super Landroid/database/ContentObserver;
.source "InputManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/wm/InputManager;->registerKeyLayoutSettingObserver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/wm/InputManager;


# direct methods
.method constructor <init>(Lcom/android/server/wm/InputManager;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "x0"

    .prologue
    .line 557
    iput-object p1, p0, Lcom/android/server/wm/InputManager$4;->this$0:Lcom/android/server/wm/InputManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 3
    .parameter "selfChange"

    .prologue
    .line 560
    iget-object v0, p0, Lcom/android/server/wm/InputManager$4;->this$0:Lcom/android/server/wm/InputManager;

    #calls: Lcom/android/server/wm/InputManager;->updateKeyLayoutFromSettings()V
    invoke-static {v0}, Lcom/android/server/wm/InputManager;->access$200(Lcom/android/server/wm/InputManager;)V

    .line 561
    return-void
.end method
