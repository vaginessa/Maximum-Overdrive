.class Lcom/android/server/StatusBarManagerService$7;
.super Landroid/content/BroadcastReceiver;
.source "StatusBarManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/StatusBarManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/StatusBarManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/StatusBarManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 595
    iput-object p1, p0, Lcom/android/server/StatusBarManagerService$7;->this$0:Lcom/android/server/StatusBarManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 597
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 598
    .local v0, action:Ljava/lang/String;
    const-string v1, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 600
    :cond_14
    iget-object v1, p0, Lcom/android/server/StatusBarManagerService$7;->this$0:Lcom/android/server/StatusBarManagerService;

    invoke-virtual {v1}, Lcom/android/server/StatusBarManagerService;->collapse()V

    .line 613
    :cond_19
    return-void
.end method